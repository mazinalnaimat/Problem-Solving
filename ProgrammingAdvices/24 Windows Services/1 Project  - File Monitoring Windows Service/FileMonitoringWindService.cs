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
            private static  string logDirectory;
            private static  string logFilePath;
            private static readonly object lockObj = new object();

            public static void WriteLog(string LogFolderPath, string Msg)
            {
                logDirectory = LogFolderPath;
                logFilePath = Path.Combine(logDirectory, "app.log");
                try
                {
                    // Ensure the directory exists
                    if (!Directory.Exists(logDirectory))
                        Directory.CreateDirectory(logDirectory);

                    string timestamp = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                    string logLine = $"{timestamp} - {Msg}";

                    lock (lockObj)
                    {
                        using (StreamWriter writer = new StreamWriter(logFilePath, true))
                        {
                            writer.WriteLine(logLine);
                        }
                    }
                }
                catch (Exception ex)
                {
                    try
                    {
                        using (EventLog eventLog = new EventLog("Application"))
                        {
                            eventLog.Source = "FileMonitoringWindService"; 
                            eventLog.WriteEntry($"File logging failed: {ex.Message}\n{ex.StackTrace}", EventLogEntryType.Error);
                        }
                    }
                    catch { /* Swallow to avoid infinite loop */ }
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

            FileWatcher = new FileSystemWatcher();

            FileWatcher.Path = ConfigurationManager.AppSettings["SrcFolderPath"];
            FileWatcher.Filter = "*.*";        

            FileWatcher.Created += OnFileCreated;

            FileWatcher.EnableRaisingEvents = true;
        }

        protected override void OnStop()
        {
            FileWatcher.EnableRaisingEvents = false;
            FileWatcher.Dispose();
            SimpleLogger.WriteLog(LogFolderPath, "Service Stopped.");

        }
        private void OnFileCreated(object sender, FileSystemEventArgs e)
        {
            string FileName = e.Name;
            string FileExt = Path.GetExtension(FileName);
            string FilePath = e.FullPath;

            SimpleLogger.WriteLog(LogFolderPath, $"File Detected: {FilePath}");


            string DesFolderPath = ConfigurationManager.AppSettings["DesFolderPath"];
            File.Move(FilePath, $"{DesFolderPath}\\{FileName}");
            if (File.Exists(FilePath))
            {
                File.Delete(FilePath);
            }
            Guid newGuid = Guid.NewGuid();
            string NewFilePath = $"{DesFolderPath}\\{Guid.NewGuid()}{FileExt}";
            File.Move($"{DesFolderPath}\\{FileName}", $"{NewFilePath}");
            SimpleLogger.WriteLog(LogFolderPath, $"File Moved: {FilePath} -> {NewFilePath}");

        }



    }
}
