using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading.Tasks;

namespace _1_Project____File_Monitoring_Windows_Service
{
    internal static class Program
    {

        static void Main()
        {
            ServiceBase[] ServicesToRun;
            ServicesToRun = new ServiceBase[]
            {
                new FileMonitoringWindService()
            };
            ServiceBase.Run(ServicesToRun);
        }

    }
}
