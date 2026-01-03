using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _43___Find_Majority_Element
{
    internal class Program
    {
        static public int FindMajorityElement(int[] Nums)
        {
            Dictionary<int, int> NumsFreq = new Dictionary<int, int>();
            int MajorityCount = Nums.Length / 2;

            foreach (int Num in Nums)
            {
                if (!NumsFreq.ContainsKey(Num))
                    NumsFreq[Num] = 0;

                NumsFreq[Num]++;

                if (NumsFreq[Num] > MajorityCount)
                    return Num;
            }

            return -1;
        }
        static void Main(string[] args)
        {
            int[] Nums = { 1, 2, 3, 3,3 };

            Console.WriteLine("Your Input is: " + string.Join(", ",Nums));
            Console.WriteLine("The majority Element is: " + FindMajorityElement(Nums));

        }
    }
}
