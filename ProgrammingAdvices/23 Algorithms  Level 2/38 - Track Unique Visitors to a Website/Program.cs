using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _38___Track_Unique_Visitors_to_a_Website
{
    internal class Program
    {
        static void Main(string[] args)
        {
            HashSet<string> UniqueVistorsIps = new HashSet<string>();
            UniqueVistorsIps.Add("192.158.2.51");
            UniqueVistorsIps.Add("192.158.2.51");
            UniqueVistorsIps.Add("192.150.2.59");
            UniqueVistorsIps.Add("192.151.2.59");
            UniqueVistorsIps.Add("192.150.2.59");
            UniqueVistorsIps.Add("192.151.56.88");
            UniqueVistorsIps.Add("192.151.98.88");

            Console.WriteLine("Total Unique Vistors:" + UniqueVistorsIps.Count());
            int Counter = 0;

            foreach (var i in UniqueVistorsIps)
            {
                Console.WriteLine(++Counter + ": " + i);
            }

            Console.ReadLine();

        }
    }
}
