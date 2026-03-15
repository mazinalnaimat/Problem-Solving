using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _57___Find_Elements_Less_Than_a_Value
{
    internal class Program
    {
        static SortedSet<int>GetElementsLessThanValue(SortedSet<int> Nums, int Value)
        {
            return Nums.GetViewBetween(Nums.Min(), Value-1);
        }
        static void Main(string[] args)
        {
            SortedSet<int> Nums = new SortedSet<int>{1 ,2, 3, 4, 5};
            SortedSet<int> NewNums = GetElementsLessThanValue(Nums, 4);

            Console.WriteLine("Nums: " + String.Join(", ", Nums));
            Console.WriteLine("New Nums: " + String.Join(", ", NewNums));
            Console.ReadKey();

        }
    }
}
