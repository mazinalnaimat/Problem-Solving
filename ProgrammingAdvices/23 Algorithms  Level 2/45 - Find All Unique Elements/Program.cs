using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace _45___Find_All_Unique_Elements
{
    internal class Program
    {

        static public List<int> FindAllUniqueNums(int[]Nums)
        {
           List<int> UniqueNums = new List<int>();
           Dictionary<int, int> NumsFreq = new Dictionary<int, int>();

            foreach (int Num in Nums)
            {
                if (NumsFreq.ContainsKey(Num))
                {
                    NumsFreq[Num]++;
                }
                else
                {
                    NumsFreq[Num] = 1;
                }
            }

            UniqueNums = new List<int> (NumsFreq.Where(Num=>Num.Value==1).Select(Num => Num.Key));
            return UniqueNums;
        }
        static void Main(string[] args)
        {
            int[] Nums = { 1, 2, 2, 2, 3, 44, 44, 55, 664, 434, 43, 2, 4, 6, 7, 7, 8 };
            Console.WriteLine("Input: " + string.Join(", ", Nums));
            List<int> UniqueNums = FindAllUniqueNums(Nums);
            Console.WriteLine("Unique Numbers: " + string.Join(", ",UniqueNums));

        }
    }
}
