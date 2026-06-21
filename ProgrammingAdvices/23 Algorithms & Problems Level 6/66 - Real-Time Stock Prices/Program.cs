using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _66___Real_Time_Stock_Prices
{
    internal class Program
    {
        static void Main()
        {
            ObservableCollection<string> stockPrices = new ObservableCollection<string>();
            stockPrices.CollectionChanged += (sender, e) =>
            {
                if (e.Action == NotifyCollectionChangedAction.Add)
                    Console.WriteLine($"New Stock Price Added: {e.NewItems[0]}");
            };

            stockPrices.Add("AAPL: 150.00");
            stockPrices.Add("MSFT: 240.50");

            Console.ReadKey();
        }
    }
}
