using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _54___Find_Smallest_and_Largest_Element
{
    internal class Program
    {
        static void Main(string[] args)
        {
            SortedSet<int> Nums = new SortedSet<int> { 4, 2, 5, 1, 3 };
            Console.WriteLine("Nums: "  + String.Join(", ", Nums));
            Console.WriteLine("Min Num: " + Nums.Min());
            Console.WriteLine("Max Num: " + Nums.Max());
        }
    }
}
