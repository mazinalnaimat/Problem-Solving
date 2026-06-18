using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace _1_Project____File_Monitoring_Windows_Service
{
    public partial class FileMonitoringWindService : ServiceBase
    {
        public static class SimpleLogger
        {
            private static readonly object LockObj = new object();

            public static void WriteLog(string LogFolderPath, string Msg)
            {
                string DefaultLogFolder = "C:\\File Monitoring\\Logs";

                try
                {
                    // Validate configured path
                    if (string.IsNullOrWhiteSpace(LogFolderPath) ||
                        LogFolderPath.IndexOfAny(Path.GetInvalidPathChars()) >= 0)
                    {
                        throw new Exception("Invalid log path.");
                    }

                    // Create folder if it does not exist
                    Directory.CreateDirectory(LogFolderPath);

                    string LogFilePath = Path.Combine(LogFolderPath, "app.log");

                    WriteLine(LogFilePath, Msg);
                }
                catch
                {
                    try
                    {
                        // Fallback to default path
                        Directory.CreateDirectory(DefaultLogFolder);

                        string LogFilePath =
                            Path.Combine(DefaultLogFolder, "app.log");

                        WriteLine(LogFilePath,
                            $"[LOGGER WARNING] Failed to use log path '{LogFolderPath}'. " +
                            $"Using default path '{DefaultLogFolder}'.");

                        WriteLine(LogFilePath, Msg);
                    }
                    catch (Exception ex)
                    {
                        try
                        {
                            using (EventLog EventLog = new EventLog("Application"))
                            {
                                EventLog.Source = "FileMonitoringWindService";
                                EventLog.WriteEntry(
                                    $"File logging failed: {ex.Message}",
                                    EventLogEntryType.Error);
                            }
                        }
                        catch { }
                    }
                }
            }

            private static void WriteLine(string logFilePath, string msg)
            {
                string timestamp = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                string logLine = $"{timestamp} - {msg}";

                lock (LockObj)
                {
                    using (StreamWriter writer = new StreamWriter(logFilePath, true))
                    {
                        writer.WriteLine(logLine);
                    }
                }
            }
        }
        FileSystemWatcher FileWatcher;
        string LogFolderPath = ConfigurationManager.AppSettings["LogFolder"];

        public FileMonitoringWindService()
        {
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {
            SimpleLogger.WriteLog(LogFolderPath, "Service Started.");
            WriteMsgOnConsoleWithTimeStamp("Service Started.");


            string DefaultSrcFolder = @"C:\File Monitoring\Source";
            string SrcFolderPath_ConfigKey = "SrcFolderPath";
            string SrcFolderPath = GetValidFolder(SrcFolderPath_ConfigKey, DefaultSrcFolder, LogFolderPath);


            FileWatcher = new FileSystemWatcher
            {
                Path = SrcFolderPath,
                Filter = "*.*",
                EnableRaisingEvents = true
            };


            FileWatcher.Created += OnFileCreated;
        }

        protected override void OnStop()
        {
            FileWatcher.EnableRaisingEvents = false;
            FileWatcher.Dispose();
            SimpleLogger.WriteLog(LogFolderPath, "Service Stopped.");
            WriteMsgOnConsoleWithTimeStamp("Service Stopped.");

        }
        private void OnFileCreated(object sender, FileSystemEventArgs e)
        {
            try 
            {
                string FileName = e.Name;
                string FileExt = Path.GetExtension(FileName);
                string FilePath = e.FullPath;

                SimpleLogger.WriteLog(LogFolderPath, $"File Detected: {FilePath}");
                WriteMsgOnConsoleWithTimeStamp($"File Detected: {FilePath}");


                string DefaultDesFolder = @"C:\File Monitoring\Destination";
                string DesFolderPath_ConfigKey = "DesFolderPath";
                string DesFolderPath = GetValidFolder(DesFolderPath_ConfigKey, DefaultDesFolder, LogFolderPath);
                File.Move(FilePath, $"{DesFolderPath}\\{FileName}");
                if (File.Exists(FilePath))
                {
                    File.Delete(FilePath);
                }
                Guid newGuid = Guid.NewGuid();
                string NewFilePath = $"{DesFolderPath}\\{Guid.NewGuid()}{FileExt}";
                File.Move($"{DesFolderPath}\\{FileName}", $"{NewFilePath}");

                SimpleLogger.WriteLog(LogFolderPath, $"File Moved: {FilePath} -> {NewFilePath}");
                WriteMsgOnConsoleWithTimeStamp($"File Moved: {FilePath} -> {NewFilePath}");
            }
   
            
            catch (Exception ex)
            {
                SimpleLogger.WriteLog(LogFolderPath, ex.Message);
                WriteMsgOnConsoleWithTimeStamp("Error: "+ ex.Message);
            }
        }
        private static string GetValidFolder(string ConfigKey, string DefaultFolder, string LogFolderPath)
        {
            string FolderPath = ConfigurationManager.AppSettings[ConfigKey];

            try
            {
                if (string.IsNullOrWhiteSpace(FolderPath) ||
                    FolderPath.IndexOfAny(Path.GetInvalidPathChars()) >= 0)
                {
                    string Msg = $"Invalid path in app.config for '{ConfigKey}'. Using default path: {DefaultFolder}";

                    SimpleLogger.WriteLog(LogFolderPath, Msg);
                    WriteMsgOnConsoleWithTimeStamp(Msg);

                    throw new Exception("Invalid path");
                }

                bool folderExists = Directory.Exists(FolderPath);

                Directory.CreateDirectory(FolderPath);

                if (!folderExists)
                {
                    string Msg = $"Folder created: {FolderPath}";

                    SimpleLogger.WriteLog(LogFolderPath, Msg);
                    WriteMsgOnConsoleWithTimeStamp(Msg);
                }

                return FolderPath;
            }
            catch (Exception ex)
            {
                bool defaultFolderExists = Directory.Exists(DefaultFolder);

                Directory.CreateDirectory(DefaultFolder);

                string Msg =
                    $"Failed to use configured path '{FolderPath}'. " +
                    $"Reason: {ex.Message}. Using default path: {DefaultFolder}";

                SimpleLogger.WriteLog(LogFolderPath, Msg);
                WriteMsgOnConsoleWithTimeStamp(Msg);

                if (!defaultFolderExists)
                {
                    Msg = $"Default folder created: {DefaultFolder}";

                    SimpleLogger.WriteLog(LogFolderPath, Msg);
                    WriteMsgOnConsoleWithTimeStamp(Msg);
                }

                return DefaultFolder;
            }
        }

        private static bool WriteMsgOnConsoleWithTimeStamp(string Msg)
        {
            if (Environment.UserInteractive)
            {
                string TimeStamp = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                string Line = $"{TimeStamp} - {Msg}";
                Console.WriteLine(Line);
                return true;
            }

            return false;

        }

        public void StartInConsole()
        {
            OnStart(null);
            Console.WriteLine("Press any key to stop this serivce...");
            Console.ReadLine();
            OnStop();
            
        }


    }
}
