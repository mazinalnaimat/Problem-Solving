using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _60___Find_All_Elements_Not_in_a_Range
{
    internal class Program
    {
        static SortedSet<int> GetAllElmentsNotInRange(SortedSet<int> Nums, int Min, int Max)
        {
            SortedSet<int> Result = new SortedSet<int>(Nums);
            SortedSet<int> Range = Nums.GetViewBetween(Min, Max);
            Result.ExceptWith(Range);
            return Result;
        }
        static void Main(string[] args)
        {
            SortedSet<int> Nums = new SortedSet<int>{1, 2, 3, 4, 5};
            Console.WriteLine("Nums: " + String.Join(", ", Nums));
            Nums = GetAllElmentsNotInRange(Nums, 2, 4);
            Console.WriteLine("New Nums: " + String.Join(", ", Nums));
            Console.ReadKey();
        }
    }
}
