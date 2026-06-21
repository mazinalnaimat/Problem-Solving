using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _6___Printer_Job_Scheduling
{
    internal class Program
    {
        static void Main(string[] args)
        {
           
                Queue<string> Jops = new Queue<string>();
                Jops.Enqueue("Check SSD");
                Jops.Enqueue("Create An Connect to Wifi");
                Jops.Enqueue("Open Word File");
                Jops.Enqueue("Connect to WiFi");

                Console.WriteLine("Processing: " + Jops.Dequeue());
                Console.WriteLine("Next Jop: " + Jops.Peek());

                Console.ReadLine();

            
        }
    }
}
