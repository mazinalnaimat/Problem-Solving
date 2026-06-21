using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace _65___Shopping_Cart_for_an_E_commerce_App
{
    internal class Program
    {
        static void Items_CollectionChanged(object sender, NotifyCollectionChangedEventArgs e)
        {
            switch (e.Action)
            {
                case System.Collections.Specialized.NotifyCollectionChangedAction.Add:
                    Console.WriteLine("Add new item to card: " + e.NewItems[0] + "\n");
                    break;

                case System.Collections.Specialized.NotifyCollectionChangedAction.Remove:
                    Console.WriteLine("Remove item to card: " + e.OldItems[0] + "\n");
                    break;

                case System.Collections.Specialized.NotifyCollectionChangedAction.Replace:
                    Console.WriteLine("Replace Item with index " + e.NewStartingIndex + " to " + e.NewItems[0] + "\n");
                    break;
            }
        }
        static void Main(string[] args)
        {
            ObservableCollection<string> Items = new ObservableCollection<string>();

            Items.CollectionChanged += Items_CollectionChanged;

            Items.Add("Tablet");
            Items.Add("Laptop");
            Items.Add("Mouse");
            Items.Add("Fridge");

            Items.Remove("Laptop");

            Items[2] = "HeadPhone";




            Console.ReadKey();

        }
    }
}
