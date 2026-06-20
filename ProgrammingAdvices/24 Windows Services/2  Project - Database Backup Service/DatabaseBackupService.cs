using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.ServiceProcess;
using System.Timers;

namespace Database_Backup_Service
{
    public partial class DatabaseBackupService : ServiceBase
    {
        public static class FolderManager
        {
            public static string EnsureFolder(string folderPath, string defaultPath,
                                              string folderName, Action<string> logger = null)
            {
                try
                {
                    if (string.IsNullOrWhiteSpace(folderPath) ||
                        folderPath.IndexOfAny(Path.GetInvalidPathChars()) >= 0)
                    {
                        logger?.Invoke($"[FOLDER ERROR] Invalid {folderName} path: {folderPath}. Using default: {defaultPath}");
                        Directory.CreateDirectory(defaultPath);
                        return defaultPath;
                    }

                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                        logger?.Invoke($"[FOLDER INFO] Created {folderName} folder: {folderPath}");
                    }
                    else
                    {
                        logger?.Invoke($"[FOLDER INFO] {folderName} folder exists: {folderPath}");
                    }

                    return folderPath;
                }
                catch (Exception ex)
                {
                    try
                    {
                        Directory.CreateDirectory(defaultPath);
                        logger?.Invoke($"[FOLDER ERROR] Failed {folderName}: {ex.Message}. Using default.");
                    }
                    catch { /* last resort – give up */ }
                    return defaultPath;
                }
            }
        }

        public static class SimpleLogger
        {
            private static readonly object LockObj = new object();

            public static void WriteLog(string logFolderPath, string message)
            {
                string logFilePath = Path.Combine(logFolderPath, "backups.log");
                WriteLine(logFilePath, message);
            }

            private static void WriteLine(string logFilePath, string message)
            {
                string timestamp = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                string logLine = $"{timestamp} - {message}";

                lock (LockObj)
                {
                    using (StreamWriter writer = new StreamWriter(logFilePath, true))
                    {
                        writer.WriteLine(logLine);
                    }
                }
            }

            public static void WriteLogInConsoleWithTimeStamp(string message)
            {
                string timestamp = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                Console.WriteLine($"{timestamp} - {message}");
            }

            public static void WriteLogInLogFolderAndConsole(string logFolder, string message)
            {
                WriteLog(logFolder, message);
                WriteLogInConsoleWithTimeStamp(message);
            }
        }

        public class DatabaseBackup
        {
            public class BackupResult
            {
                public bool IsSuccess { get; set; }
                public string Message { get; set; }
            }

            private readonly string _connectionString;
            private readonly string _databaseName;
            private readonly string _backupFolder;

            public string BackupFile { get; private set; }

            public DatabaseBackup(string connectionString, string databaseName, string backupFolder)
            {
                _connectionString = connectionString;
                _databaseName = databaseName;
                _backupFolder = backupFolder;
            }

            private static string QuoteSqlIdentifier(string identifier)
            {
                string escaped = identifier?.Replace("]", "]]") ?? string.Empty;
                return $"[{escaped}]";
            }
            public bool TakeBackup(Action<BackupResult> callback)
            {
                BackupFile = Path.Combine(
                    _backupFolder,
                    $"{_databaseName}_{DateTime.Now:yyyyMMdd_HHmmss}.bak"
                );

                string sql = $@"
                    BACKUP DATABASE {QuoteSqlIdentifier(_databaseName)}
                    TO DISK = @BackupPath
                    WITH INIT";  

                try
                {
                    using (var connection = new SqlConnection(_connectionString))
                    {
                        connection.Open();
                        using (var command = new SqlCommand(sql, connection))
                        {
                            command.Parameters.AddWithValue("@BackupPath", BackupFile);
                            command.CommandTimeout = 0;   // wait indefinitely for backup
                            command.ExecuteNonQuery();
                        }
                    }

                    callback?.Invoke(new BackupResult
                    {
                        IsSuccess = true,
                        Message = $"Backup succeeded: {BackupFile}"
                    });
                    return true;
                }
                catch (Exception ex)
                {
                    callback?.Invoke(new BackupResult
                    {
                        IsSuccess = false,
                        Message = $"Backup failed: {ex.Message}"
                    });
                    return false;
                }
            }
        }

        private string logFolder;
        private string backupFolder;
        private DatabaseBackup backup;        
        private Timer timer;

        private static readonly string DefaultLogFolder = @"C:\Backups\Logs";
        private static readonly string DefaultBackupFolder = @"C:\Backups";

        public DatabaseBackupService()
        {
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {
            // 1. Ensure log folder
            logFolder = FolderManager.EnsureFolder(
                ConfigurationManager.AppSettings["LogFolder"],
                DefaultLogFolder,
                "Log",
                 SimpleLogger.WriteLogInConsoleWithTimeStamp   // <-- no file logging yet
            );

            SimpleLogger.WriteLogInLogFolderAndConsole(logFolder, "Service Is Started");

            // 2. Ensure backup folder
            backupFolder = FolderManager.EnsureFolder(
                ConfigurationManager.AppSettings["BackupFolder"],
                DefaultBackupFolder,
                "Backup",
                msg => SimpleLogger.WriteLogInLogFolderAndConsole(logFolder, msg)
            );

            // 3. Build the DatabaseBackup object NOW, using the final ensured paths
            string connectionString = ConfigurationManager.AppSettings["ConnectionString"];
            string databaseName = new SqlConnectionStringBuilder(connectionString).InitialCatalog;
            backup = new DatabaseBackup(connectionString, databaseName, backupFolder);

            // 4. Read interval
            int intervalMinutes = Convert.ToInt32(ConfigurationManager.AppSettings["BackupIntervalMinutes"]);
            SimpleLogger.WriteLogInLogFolderAndConsole(logFolder,
                $"Take Backup every {intervalMinutes} Minutes.");

            // 5. Start the timer
            timer = new Timer(intervalMinutes * 60 * 1000);
            timer.Elapsed += OnTimerElapsed;
            timer.Start();
        }

        protected override void OnStop()
        {
            SimpleLogger.WriteLogInLogFolderAndConsole(logFolder, "Service Is Stopped.");
            timer?.Stop();
            timer?.Dispose();
        }

        private void OnTimerElapsed(object sender, ElapsedEventArgs e)
        {
            try
            {
                backup?.TakeBackup(result =>
                {
                    SimpleLogger.WriteLogInLogFolderAndConsole(
                        logFolder,
                        (result.IsSuccess ? "[SUCCESS] " : "[ERROR] ") + result.Message
                    );
                });
            }
            catch (Exception ex)
            {
                // Prevent a single timer tick from crashing the service
                SimpleLogger.WriteLogInLogFolderAndConsole(logFolder, $"[CRITICAL] Timer handler error: {ex.Message}");
            }
        }

        public void StartInConsole()
        {
            OnStart(null);
            Console.WriteLine("Press any key to exit...");
            Console.ReadKey();
            OnStop();
        }
    }
}