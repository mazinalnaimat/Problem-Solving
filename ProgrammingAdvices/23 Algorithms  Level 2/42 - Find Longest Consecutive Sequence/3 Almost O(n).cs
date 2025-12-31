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
        
        //3 Almost O(n)
        
        static public int FindLongestConsecutiveSequence(int[] Nums)
        {
            if (Nums.Length == 0) return 0;

            HashSet<int> UniqueNums = new HashSet<int>(Nums);

            int Min = UniqueNums.Min();
            int Max = Min;
            int countLength = 1;
            int maxLength = 1;

            int Num = Max;

            while (UniqueNums.Count > 1)
            {
                UniqueNums.Remove(Num);
                if (UniqueNums.Contains(Min - 1))
                {
                    Min = Min - 1;
                    Num = Min;
                    countLength++;

                }
                else if (UniqueNums.Contains(Max + 1))
                {
                    Max = Max + 1;
                    Num = Max;
                    countLength++;
                }
                else 
                {
                    if (countLength > maxLength)
                    {
                        maxLength = countLength;
                    }
                    Num = UniqueNums.First();
                    Min=Max=Num;
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
