using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration.Install;
using System.Linq;
using System.ServiceProcess;
using System.Threading.Tasks;

namespace Database_Backup_Service
{
    [RunInstaller(true)]
    public partial class ProjectInstaller : System.Configuration.Install.Installer
    {
        private ServiceProcessInstaller processInstaller;
        private ServiceInstaller serviceInstaller;
        public ProjectInstaller()
        {
            InitializeComponent();

            // Service account
            processInstaller = new ServiceProcessInstaller
            {
                Account = ServiceAccount.LocalSystem
            };

            // Service configuration
            serviceInstaller = new ServiceInstaller
            {
                ServiceName = "DatabaseBackupService",
                DisplayName = "Database Backup Service",
                StartType = ServiceStartMode.Manual,
                Description = "This service will take backup of database every specific interval.",
                ServicesDependedOn = new string[]
                {
                    "RpcSs",
                    "EventLog",
                    "MSSQLSERVER"  
                }
            };



            Installers.Add(processInstaller);
            Installers.Add(serviceInstaller);



        }
    }
}
