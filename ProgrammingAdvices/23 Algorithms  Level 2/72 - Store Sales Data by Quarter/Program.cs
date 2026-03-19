using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _72___Store_Sales_Data_by_Quarter
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int[][] RegionsSales = new int[3][];

            RegionsSales[0] = new int[] { 10000, 12000, 11000 };
            RegionsSales[1] = new int[] { 15000, 16000 };
            RegionsSales[2] = new int[] { 9000, 9500, 9800, 10200 };

            for (int i = 0; i < RegionsSales.Length; i++)
            {
                Console.Write("Region" + (i + 1) + " Sales: ");
                Console.WriteLine(String.Join(", ", RegionsSales[i]));
            }

            Console.ReadKey();
        }
    }
}
