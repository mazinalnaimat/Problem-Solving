using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _62___Check_If_Set_Contains_Multiple_Ranges
{
    internal class Program
    {
        static int IsSetContainsAllRanges(SortedSet<int> Nums, List<List<int>> Ranges)
        {
            foreach (List<int> Range in Ranges)
            {
                if (Range.Count() != 2)
                {
                    return -1;
                }
            }

            foreach (List<int> Range in Ranges)
            {
                if (Nums.GetViewBetween(Range.Min(), Range.Max()).Count() != Range.Max() - Range.Min()+1)
                {
                    return 0;
                }
            }

            return 1;

        }
        static int IsSetContainsAllRanges(SortedSet<int> Nums, List<List<int>> Ranges, out string ErrorMsg)
        {
            ErrorMsg = "";
            int Result = IsSetContainsAllRanges(Nums, Ranges);
            if (Result ==-1)
            {
                ErrorMsg = "Must All Ragnes Are Valid!!!";
            }
            return Result;
        }
        static void Main(string[] args)
        {
            SortedSet<int> Nums = new SortedSet<int>{1, 2, 3, 4, 5};
            List<List<int>> Ranges = new List<List<int>>();
            Ranges.Add(new List<int> {1, 2});
            Ranges.Add(new List<int> {2, 4});
            Console.WriteLine("Nums: " + String.Join(", ", Nums));
            Console.WriteLine("Ranges: ");
            int Counter = 1;
            foreach (List<int> Range in Ranges)
            {
                Console.WriteLine($"\tRange{Counter}: " + String.Join(", ", Range));
                Counter++;
            }

            Console.WriteLine("\nIs Nums Contain All Ranges: " + IsSetContainsAllRanges(Nums, Ranges));
            Console.ReadKey();

        }
    }
}
