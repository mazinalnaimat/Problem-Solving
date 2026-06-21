using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _59___Remove_All_Elements_Within_a_Range
{
    internal class Program
    {
        static SortedSet<int> RemoveAllElementsInRange(SortedSet<int> Nums, int Min, int Max)
        {

           Nums.GetViewBetween(Min, Max).Clear();
            return Nums;
        }
        static void Main(string[] args)
        {
            SortedSet<int> Nums = new SortedSet<int>{1, 2, 3, 4, 5};
            Console.WriteLine("Nums: " + String.Join(", ", Nums));
            Nums = RemoveAllElementsInRange(Nums, 2, 4);
            Console.WriteLine("New Nums: " + String.Join(", ", Nums));
            Console.ReadKey();
        }
    }
}
