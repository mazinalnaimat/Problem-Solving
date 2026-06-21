using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _64___Dynamic_List_of_Students_in_a_Classroom
{
    internal class Program
    {
        // CollectionChanged Event Handler
        static void Students_CollectionChanged(object sender, System.Collections.Specialized.NotifyCollectionChangedEventArgs e)
        {
            Console.WriteLine("\nStudents Changed:");


            // Handling Collection Changes
            switch (e.Action)
            {
                case System.Collections.Specialized.NotifyCollectionChangedAction.Add:
                    Console.WriteLine("Added:");
                    foreach (var newItem in e.NewItems)
                    {
                        Console.WriteLine("- " + newItem);
                    }
                    break;


                case System.Collections.Specialized.NotifyCollectionChangedAction.Remove:
                    Console.WriteLine("Removed:");
                    foreach (var oldItem in e.OldItems)
                    {
                        Console.WriteLine("- " + oldItem);
                    }
                    break;


                case System.Collections.Specialized.NotifyCollectionChangedAction.Replace:
                    Console.WriteLine("Replaced:");
                    foreach (var oldItem in e.OldItems)
                    {
                        Console.WriteLine("- " + oldItem);
                    }
                    Console.WriteLine("With:");
                    foreach (var newItem in e.NewItems)
                    {
                        Console.WriteLine("- " + newItem);
                    }
                    break;


                case System.Collections.Specialized.NotifyCollectionChangedAction.Move:
                    Console.WriteLine("Moved:");
                    Console.WriteLine($"- From index {e.OldStartingIndex} to index {e.NewStartingIndex}");
                    break;
            }
        }
        static void Main(string[] args)
        {
            ObservableCollection<string> Students = new ObservableCollection<string>();
            Students.CollectionChanged += Students_CollectionChanged;
            Students.Add("Ahmed");


            Students.Add("Salim");
            Students.Add("Mo'ath");
            Students.Add("Omeran");
            Students.Add("Tariq");

            Students[0] = "Mohammad";

            Students.Remove("Hazem");
            Students.Remove("Tariq");

            Students.Move(0, 2);




            Console.ReadKey();


        }
    }
}
