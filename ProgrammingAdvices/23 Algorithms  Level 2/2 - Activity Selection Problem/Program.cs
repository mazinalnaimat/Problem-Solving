using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2___Activity_Selection_Problem
{
    internal class Program
    {
        struct Activity
        { 
            public int Start;
            public int End;
        };

        static List<Activity> GetMaxActivitiesByOnePerson(List<Activity> Activities)
        {            

            List <Activity> MaxActivitiesByOnePerson = new List<Activity>();
            Activities.Sort((Act1, Act2)=> Act1.End.CompareTo(Act2.End));

            Nullable <Activity>LastSelectActivity= null;

            foreach(Activity Activity in Activities)
            {
                if(LastSelectActivity ==null || Activity.Start >=LastSelectActivity.Value.End)
                {
                    MaxActivitiesByOnePerson.Add(Activity);
                    LastSelectActivity= Activity;
                }
            }

            return MaxActivitiesByOnePerson;
        }
  
        static void Main(string[] args)
        {
            List<Activity> Activities = new List<Activity>();
            Activities.Add(new Activity { Start = 1, End = 4 });
            Activities.Add(new Activity { Start = 3, End = 5 });
            Activities.Add(new Activity { Start = 3, End = 5 });
            Activities.Add(new Activity { Start = 0, End = 6 });
            Activities.Add(new Activity { Start = 5, End = 7 });
            Activities.Add(new Activity { Start = 8, End = 9 });
            Activities.Add(new Activity { Start = 5, End = 9 });
            Activities.Add(new Activity { Start = 1, End = 2 });
            Activities.Add(new Activity { Start = 3, End = 5 });
            Activities.Add(new Activity { Start = 0, End = 1 });



            Console.WriteLine("Activity List: ");

            Activities.ForEach(Activity => Console.WriteLine("Start: " + Activity.Start + " End: " + Activity.End));

            Console.WriteLine("________________________________________________________");

            Console.WriteLine("Max Activities By One Person List: ");

            List<Activity>  MaxActivitiesByOnePerson = GetMaxActivitiesByOnePerson(Activities);
            MaxActivitiesByOnePerson.ForEach(Activity=>Console.WriteLine("Start: " + Activity.Start + " End: " + Activity.End ));

            Console.ReadLine();

        }
    }
}
