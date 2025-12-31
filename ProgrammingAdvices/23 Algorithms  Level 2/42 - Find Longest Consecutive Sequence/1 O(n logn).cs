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
        
        //1 O(nlogn) Time Coplexity        
        static public int FindLongestConsecutiveSequence(int[] Nums)
        {
            if (Nums.Length == 0) return 0;

            HashSet<int> UniqueNums = new HashSet<int>(Nums);
            List<int> SortedUniqueNums = new List<int>(UniqueNums);
            SortedUniqueNums.Sort();

            int countLength = 1;
            int maxLength = 1;

            for (int i = 1; i < SortedUniqueNums.Count; i++)
            {
                if (SortedUniqueNums[i - 1] + 1 == SortedUniqueNums[i])
                {
                    countLength++;
                }
                else
                {
                    maxLength = Math.Max(maxLength, countLength);
                    countLength = 1;
                }
            }

            return Math.Max(maxLength, countLength);
        }
        

 


        static void Main(string[] args)
        {
            int[] Nums = { 100, 4, 200, 3, 1, 2, 5 , 7,8,9,10,11,12};   
            Console.WriteLine(FindLongestConsecutiveSequence(Nums));
        }
    }
}
