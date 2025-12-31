using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Schema;

namespace _42___Find_Longest_Consecutive_Sequence
{
    internal class Program
    {   

        //4 O(n) Time Comlexity
        static public int FindLongestConsecutiveSequence(int[] Nums)
        {
            if (Nums.Length == 0) return 0;

            HashSet<int> UniqueNums = new HashSet<int>(Nums);

            int MaxLength = 1;


            foreach (int Num in UniqueNums)
            {
                if (!UniqueNums.Contains(Num - 1))  // Only start at the beginning of a sequence
                {
                    int CurrentNum = Num;
                    int CountLength = 1;

                    while (UniqueNums.Contains(CurrentNum + 1))  // ← This is the loop you’re asking about
                    {
                        CurrentNum++;
                        CountLength++;
                    }

                    MaxLength = Math.Max(MaxLength, CountLength);
                }
            }

            return MaxLength;
        }


        static void Main(string[] args)
        {
            int[] Nums = { 100, 4, 200, 3, 1, 2, 5 , 7,8,9,10,11,12};   
            Console.WriteLine(FindLongestConsecutiveSequence(Nums));
        }
    }
}
