using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _56___Remove_Elements_Greater_Than_a_Value
{
    internal class Program
    {
        static SortedSet<int>RemoveElementsGreaterThanValue(SortedSet<int> Nums, int Value)
        {
            return Nums.GetViewBetween(Nums.Min(), Value);
        }
        static void Main(string[] args)
        {
            SortedSet<int> Nums = new SortedSet<int> {1, 2, 3, 4, 5};
            SortedSet<int> NewNums = new SortedSet<int>();
            NewNums = RemoveElementsGreaterThanValue(Nums, 3);

            Console.WriteLine("Nums: " + String.Join(", " ,Nums));
            Console.WriteLine("New Nums: " + String.Join(", ", NewNums));
            Console.ReadKey();
        }
    }
}
