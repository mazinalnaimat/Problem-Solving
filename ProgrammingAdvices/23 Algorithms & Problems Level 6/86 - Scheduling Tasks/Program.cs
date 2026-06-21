using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _86___Scheduling_Tasks
{
    internal class Program
    {
        static void Main()
        {
            BitArray schedule = new BitArray(7, true); // All days are busy
            schedule[5] = false; // Saturday is free
            schedule[6] = false; // Sunday is free


            Console.WriteLine("Free Days:");
            for (int i = 0; i < 7; i++)
            {
                if (!schedule[i]) Console.WriteLine($"Day {i + 1}");
            }
            Console.ReadKey();
        }
    }
}
