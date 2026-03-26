using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _106___Manage_Reserved_Seats_in_a_Theater
{
    internal class Program
    {
        static void Main()
        {
            SortedSet<int> reservedSeats = new SortedSet<int> { 10, 20, 30 };


            reservedSeats.Add(25);


            if (!reservedSeats.Add(10))
            {
                // Duplicate, won't be added
                Console.WriteLine("\nSeat 10 is already reserved!\n");
            }
            ;


            Console.WriteLine("Reserved Seats:");
            foreach (var seat in reservedSeats)
            {
                Console.WriteLine("Seat " + seat);
            }


            Console.WriteLine("\nPress any key to exit...");
            Console.ReadKey();
        }
    }
}
