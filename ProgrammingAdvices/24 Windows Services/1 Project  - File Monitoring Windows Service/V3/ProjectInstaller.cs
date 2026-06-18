using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration.Install;
using System.Linq;
using System.ServiceProcess;
using System.Threading.Tasks;

namespace _1_Project____File_Monitoring_Windows_Service
{
    [RunInstaller(true)]
    public partial class ProjectInstaller : System.Configuration.Install.Installer
    {
         
        private ServiceProcessInstaller serviceProcessInstaller;
        private ServiceInstaller serviceInstaller;

        public ProjectInstaller()
        {
            InitializeComponent();

            serviceProcessInstaller = new ServiceProcessInstaller
            {
                Account = ServiceAccount.LocalSystem
            };

            // Configure the Service Installer
            serviceInstaller = new ServiceInstaller
            {
                ServiceName = "FileMonitoringWindService",
                DisplayName = "File Monitoring Windows Service",
                StartType = ServiceStartMode.Manual,
                ServicesDependedOn = new string[] { "RpcSs", "EventLog", "LanmanWorkstation" } // Dependencies

            };

            Installers.Add(serviceProcessInstaller);
            Installers.Add(serviceInstaller);
        }
    }
}



