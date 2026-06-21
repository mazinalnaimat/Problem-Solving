using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _55___Union_of_Two_SortedSets
{
    internal class Program
    {
        static void Main(string[] args)
        {
            SortedSet<int> Nums1 = new SortedSet<int> {1, 2, 3};
            SortedSet<int> Nums2 = new SortedSet<int> {3, 4, 5};


            Console.WriteLine("Nums1: " + String.Join(",", Nums1));
            Console.WriteLine("Nums2: " + String.Join(",", Nums2));
            Nums1.UnionWith(Nums2);
            Console.WriteLine("Union Nums: " + String.Join(",", Nums1));

            Console.ReadKey();
        }
    }
}
