using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _12____Web_Page_Request_Handling
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Queue<string> Requests = new Queue<string>();
            Requests.Enqueue("Request1");
            Requests.Enqueue("Request2");
            Requests.Enqueue("Request3");


            Console.WriteLine("Processing web requests:\n");
            while (Requests.Count > 0)
            {
                string CurrentRequest = Requests.Dequeue();
                Console.WriteLine($"Processed: {CurrentRequest}");
            }
            Console.ReadKey();
        }
    }
}
