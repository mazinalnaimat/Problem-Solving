using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _96___Sort_and_Remove_Duplicates_from_a_List
{
    internal class Program
    {
        static void Main(string[] args)
        {
            List<int> Nums = new List<int> { 1, 2, 2, 4, 4, 5, 1, 5, 6, 2, 3, 5, };
            HashSet<int> UnqNums = new HashSet<int>(Nums);
            
            Console.WriteLine("Nums:");
            Console.WriteLine(String.Join(", " , Nums));
            Console.WriteLine();

            Console.WriteLine("UnqNums:");
            Console.WriteLine(String.Join(", ", UnqNums));


            Console.ReadKey();
        }
    }
}
