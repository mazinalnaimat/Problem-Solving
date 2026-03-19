using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _74___Daily_Sales_for_Different_Products
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int[][] ProductsDailySales = new int[3][];

            ProductsDailySales[0] = new int[] {12, 20, 40 ,13, 1, 5};
            ProductsDailySales[1] = new int[] {8, 15, 90, 15, 3};
            ProductsDailySales[2] = new int[] {10, 13 , 89, 34, 53, 23 ,92};

            Console.WriteLine("Products Daily Sales:\n");
            for(int i=0; i<ProductsDailySales.Length; i++)
            {
                Console.Write("Product" + (i + 1) + ": ");
                Console.WriteLine(String.Join(", ", ProductsDailySales[i]));
            }

            Console.ReadKey();
        }
    }
}
