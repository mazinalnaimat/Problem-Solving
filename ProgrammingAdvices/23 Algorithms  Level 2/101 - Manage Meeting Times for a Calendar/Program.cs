using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _101___Manage_Meeting_Times_for_a_Calendar
{
    internal class Program
    {
        static void Main(string[] args)
        {
            SortedSet<TimeSpan> MeetingTimes = new SortedSet<TimeSpan>();

            MeetingTimes.Add(new TimeSpan(14, 15, 0));
            MeetingTimes.Add(new TimeSpan(13, 30, 0));
            MeetingTimes.Add(new TimeSpan(10, 15, 0));
            MeetingTimes.Add(new TimeSpan(14, 40, 0));

            Console.WriteLine("Meetings:");
            Console.WriteLine(String.Join("\n", MeetingTimes));

            Console.ReadKey();


        }
    }
}
