using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace _105___Schedule_Tasks_Based_on_Priority
{
    internal class Program
    {

        public class Task : IComparable<Task>
        {

            public string Name { get; set; }
            public int Priority { get; set; }

            public Task(string Name, int Priority)
            {
                this.Name = Name;
                this.Priority = Priority;
            }

            public int CompareTo(Task Other)
            {

                int result = this.Priority.CompareTo(Other.Priority);
                if (result == 0)
                {
                    result = this.Name.CompareTo(Other.Name);
                }
                return result;
            }

        }
        static void Main(string[] args)
        {

            SortedSet<Task> Tasks = new SortedSet<Task>();

            Tasks.Add(new Task("Edge", 1));
            Tasks.Add(new Task("Chrome", 5));
            Tasks.Add(new Task("Firefox", 3));
            Tasks.Add(new Task("VSC", 2));
            Tasks.Add(new Task("OBS", 2));

            Console.WriteLine("Tasks:");

            int Counter = 0;
            foreach (Task T in Tasks)
            {
                Counter++;
                Console.WriteLine("Task " + Counter + ": " + T.Name + ", Pri:" + T.Priority);
            }


            Console.ReadKey();
        }
    }
}
