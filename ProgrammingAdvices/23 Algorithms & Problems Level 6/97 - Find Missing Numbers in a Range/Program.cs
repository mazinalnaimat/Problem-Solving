using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _97___Find_Missing_Numbers_in_a_Range
{
    internal class Program
    {
        class Range
        {
            public int Min { get; set; }
            public int Max { get; set; }

            public Range(int Min, int Max)
            {
                this.Min = Min;
                this.Max = Max;
            }
        }

        static SortedSet<int> FindMissingNumsInRange(SortedSet<int> Nums, Range Ran)
        {
            SortedSet<int> MissingNums = new SortedSet<int>();

            SortedSet<int> NumsInRange = Nums.GetViewBetween(Ran.Min, Ran.Max);
            for (int i = Ran.Min; i <= Ran.Max; i++)
            {
                if (!Nums.Contains(i))
                { 
                    MissingNums.Add(i);
                }
            }
            return MissingNums;
        }
        static void Main()
        {
            SortedSet<int> numbers = new SortedSet<int> { 1, 2, 4, 5, 7 };

            for (int i = 1; i <= 7; i++)
            {
                if (!numbers.Contains(i))
                {
                    Console.WriteLine($"Missing number: {i}");
                }
            }

            Console.WriteLine("Press any key to exit...");
            Console.ReadKey();
        }
    }
}
