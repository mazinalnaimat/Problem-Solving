using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _58___Count_Elements_Greater_Than_a_Value
{
    internal class Program
    {
        static int GetElementsNumGreaterThan(SortedSet<int> Nums, int Value)
        {
            return Nums.GetViewBetween(Value +1 , Nums.Max()).Count();
        }
        static void Main(string[] args)
        {
            SortedSet<int> Nums = new SortedSet<int>{ 1, 2, 3, 4, 5};
            int Value = 3;
            SortedSet<int> NewNums = Nums.GetViewBetween(Value + 1, Nums.Max());
            int NewNumsCount = GetElementsNumGreaterThan(Nums, Value);
            Console.WriteLine("Nums: " + String.Join(", " , Nums));
            Console.WriteLine("New Nums: " + String.Join(", ", NewNums));
            Console.WriteLine("New Nums Count: " + NewNumsCount);
            Console.ReadKey();
        
        }
    }
}
