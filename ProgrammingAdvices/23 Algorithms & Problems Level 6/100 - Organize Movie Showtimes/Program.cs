using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _100___Organize_Movie_Showtimes
{
    internal class Program
    {
        static void Main()
        {
            SortedSet<DateTime> showtimes = new SortedSet<DateTime>
        {
            new DateTime(2024, 11, 19, 14, 0, 0),
            new DateTime(2024, 11, 19, 12, 30, 0),
            new DateTime(2024, 11, 19, 16, 15, 0)
        };

            Console.WriteLine("Next showtime: " + showtimes.Min);
            Console.WriteLine("All showtimes:");
            foreach (var time in showtimes)
            {
                Console.WriteLine(time.ToShortTimeString());
            }

            Console.WriteLine("Press any key to exit...");
            Console.ReadKey();
        }
    }
}
