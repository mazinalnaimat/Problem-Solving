using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _50___Find_Numbers_Disappeared_in_an_Array
{
    internal class Program
    {
        static public List<int> FindNumsDisappearedInArray(in int[]Arr)
        {
            HashSet<int> set = new HashSet<int>(Arr);
            List<int> NumsDisappearedInArray = new List<int>();
            for(int i=1; i<=Arr.Max();i++)
            {
                if(!set.Contains(i))
                    NumsDisappearedInArray.Add(i);
            }

            return NumsDisappearedInArray;
        }
        static void Main(string[] args)
        {
            int[] Arr = new int[]{ 4, 3, 2, 7, 8, 2, 3, 1 };
            Console.WriteLine("The input: " + string.Join(", ", Arr));

            Console.WriteLine("Nums Disappeared In Array: " + string.Join(", ", FindNumsDisappearedInArray(Arr)));
 
            Console.ReadLine();
        }
    }
}
