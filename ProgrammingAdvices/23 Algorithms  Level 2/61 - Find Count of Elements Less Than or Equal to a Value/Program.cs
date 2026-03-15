using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _61___Find_Count_of_Elements_Less_Than_or_Equal_to_a_Value
{
    internal class Program
    {
        static int GetElementsCountLessThanOrEqual(SortedSet<int> Nums, int Value)
        {
            return Nums.GetViewBetween(Nums.Min(), Value).Count();
        }
        static void Main(string[] args)
        {
            SortedSet<int> Nums = new SortedSet<int> { 1, 2, 3, 4, 5 };
            int Value = 3;
            Console.WriteLine("Nums: " + String.Join(", ", Nums));
            Console.WriteLine("New Nums: " + String.Join(", ", Nums.GetViewBetween(Nums.Min(), Value)));
            Console.WriteLine("New Nums Count: " + GetElementsCountLessThanOrEqual(Nums, Value));
            Console.ReadKey();
        }

    }
}
