using System;
using System.Collections.ObjectModel;
using System.Collections.Specialized;

namespace _68___Live_Chat_Application
{
    internal class Program
    {
        static void Main(string[] args)
        {
            ObservableCollection<string> Msgs = new ObservableCollection<string>();

            Msgs.CollectionChanged += (sender, e) =>
            {
                if (e.Action == NotifyCollectionChangedAction.Add)
                {
                    foreach (var item in e.NewItems)
                    {
                        Console.WriteLine(item);
                    }
                }
            };

            Msgs.Add("Ali: Hi Ahmad, how are you?");
            Msgs.Add("Ahmad: I'm good bro, what about you?");
            Msgs.Add("Ali: I'm doing great");
            Msgs.Add("Ahmad: Did you finish the assignment?");
            Msgs.Add("Ali: Not yet , still working on it");
            Msgs.Add("Ahmad: Same here ");
            Msgs.Add("Ali: By the way, is tomorrow off?");
            Msgs.Add("Ahmad: I think yes, but not sure");
            Msgs.Add("Ali: Let's confirm later");
            Msgs.Add("Ahmad: Deal ");

            Console.ReadKey();
        }
    }
}