using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _53___Find_Elements_in_a_Range
{
    internal class Program
    {
        static List <int> GetNumbersBetweenNum1AndNum2(List <int> Numbers, int Num1, int Num2)
        {
            SortedSet<int> SortedNumbers = new SortedSet<int>(Numbers);
            return new List<int>(SortedNumbers.GetViewBetween(Num1, Num2));
        }
        static void Main(string[] args)
        {
            List<int> Nums = new List<int>{ 1, 3, 8, 3, 5, 9, 12, 15, 8, 19, 1, 1, 1, 2, 5, 14, 13 };
            int Num1 = 12, Num2 = 19;
            Console.WriteLine("Nums : " + String.Join(", ", Nums));
            Console.WriteLine($"Nums between {Num1} and {Num2}: " + String.Join(", ", GetNumbersBetweenNum1AndNum2(Nums, Num1, Num2)));
        }
    }
}
