using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _85___Optimizing_Space_in_Large_Data
{
    internal class Program
    {
        static void Main(string[] args)
        {
            BitArray Seats = new BitArray(1000);

            Seats[0] = false;
            Seats[1] = true;
            Seats[2] = true;
            Seats[3] = false;

            Console.WriteLine($"{"Seat number",-15} {"Is free",-10}");

            for (int i = 0; i < 5; i++)
            {
                Console.WriteLine($"{' ',4}{i + 1,-8}{' ', 5}{Seats[i],-10}");
            }

            Console.ReadKey();
        }
    }
}
