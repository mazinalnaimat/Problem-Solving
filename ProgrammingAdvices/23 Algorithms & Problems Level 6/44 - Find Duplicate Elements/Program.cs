using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _44___Find_Duplicate_Elements
{
    internal class Program
    {
        static public void DuplicateNums(int[] Nums, out HashSet<int> DupNums)
        {
            
            HashSet<int> UniqueNums = new HashSet<int>();
            DupNums = new HashSet<int>();

            for (int i = 0; i < Nums.Length; i++)
            {
                if (!UniqueNums.Contains(Nums[i]))
                {
                    UniqueNums.Add(Nums[i]);
                }
                else 
                {
                    DupNums.Add(Nums[i]);
                }

            }
        }
        static void Main(string[] args)
        {

            int[] Nums = new int[] { 1, 2, 5, 4, 6, 8, 8, 8, 1, 1, 2, 3, 4, 4, 7, 7, 77, 88 };
            Console.WriteLine("Nums: "+ string.Join(", ", Nums));
            HashSet<int> DupNums = new HashSet<int>();
            DuplicateNums(Nums, out DupNums);
            Console.WriteLine("Duplicate Numbers: " + string.Join(", ", DupNums));

        }
    }
}
