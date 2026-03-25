using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _99___Automatically_Sort_Event_Timelines
{
    internal class Program
    {
        static void Main(string[] args)
        {

            SortedSet <DateTime> Events = new SortedSet <DateTime> ();

            Events.Add(new DateTime(2026, 8, 10, 12, 25, 00));
            Events.Add(new DateTime(2026, 12, 12, 13, 10, 00));
            Events.Add(new DateTime(2026, 9, 21, 15, 51, 00));

            Console.WriteLine("Events:");
            Console.WriteLine(String.Join("\n", Events));

            Console.ReadKey();
        }
    }
}
