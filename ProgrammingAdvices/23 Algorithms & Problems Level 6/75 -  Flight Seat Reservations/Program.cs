using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _75____Flight_Seat_Reservations
{
    internal class Program
    {
        static void Main()
        {
            bool[][] flightSeats = new bool[2][];
            flightSeats[0] = new bool[] { true, false, true }; 
            flightSeats[1] = new bool[] { false, false, true, true }; 


            Console.WriteLine("Seat Availability:");
            for (int i = 0; i < flightSeats.Length; i++)
            {
                Console.Write($"Flight {i + 1}: ");
                foreach (bool seat in flightSeats[i])
                {
                    Console.Write(seat ? "Available " : "Occupied ");
                }
                Console.WriteLine();
            }
            Console.ReadKey();
        }
    }
}
