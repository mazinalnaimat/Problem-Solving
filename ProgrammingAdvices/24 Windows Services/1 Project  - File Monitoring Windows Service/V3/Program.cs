using System;
using System.ServiceProcess;

namespace _1_Project____File_Monitoring_Windows_Service
{
    internal static class Program
    {
        static void Main()
        {
            if (Environment.UserInteractive)
            {
                // RUN AS CONSOLE (DEBUG MODE)
                var service = new FileMonitoringWindService();

                service.StartInConsole();

            }
            else
            {
                // RUN AS WINDOWS SERVICE
                ServiceBase[] ServicesToRun = new ServiceBase[]
                {
                    new FileMonitoringWindService()
                };

                ServiceBase.Run(ServicesToRun);
            }
        }
    }
}