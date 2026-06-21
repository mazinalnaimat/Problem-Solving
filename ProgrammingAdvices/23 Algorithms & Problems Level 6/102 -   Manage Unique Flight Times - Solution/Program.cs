using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _102_____Manage_Unique_Flight_Times___Solution
{
    internal class Program
    {
        static void Main(string[] args)
        {
            SortedSet<TimeSpan> FlightTimes = new SortedSet<TimeSpan>();

            FlightTimes.Add(new TimeSpan(12, 20, 0));
            FlightTimes.Add(new TimeSpan(10, 45, 0));
            FlightTimes.Add(new TimeSpan(11, 10, 0));
            FlightTimes.Add(new TimeSpan(11, 10, 0));

            Console.WriteLine("Flight Times:");
            Console.WriteLine(String.Join("\n", FlightTimes));

            Console.ReadKey();

        }
    }
}
