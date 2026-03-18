using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _70___Real_Time_Notification_System
{
    internal class Program
    {
        static void Main()
        {
            ObservableCollection<string> notifications = new ObservableCollection<string>();
            notifications.CollectionChanged += (sender, e) =>
            {
                if (e.Action == NotifyCollectionChangedAction.Add)
                    Console.WriteLine($"New Notification: {e.NewItems[0]}");
            };

            notifications.Add("Your order is under processing.");
            notifications.Add("Your order has been shipped.");
            notifications.Add("Your order is Delivered.");
            Console.ReadKey();
        }
    }
}
