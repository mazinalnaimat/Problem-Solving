using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _49___Find_Element_In_Arr1_Not_Subset_Of_Arr2
{
    internal class Program
    {

        static public List<int> FindElementInArr1NotSubsetOfArr2(in int[]Arr1, in int[] Arr2)
        { 
            List<int> ElementsInArr1NotSubsetOfArr2 = new List<int>();
            HashSet<int> Set2 = new HashSet<int>(Arr2);

            foreach (int Num in Arr1)
            {
                if (!Set2.Contains(Num))
                {
                    ElementsInArr1NotSubsetOfArr2.Add(Num);
                }
            }
            return ElementsInArr1NotSubsetOfArr2;
        }
        static void Main(string[] args)
        {
            int[] Arr1 = { 1, 2, 3, 4 };
            int[] Arr2 = { 3, 4, 5, 6 };
            Console.WriteLine("Arr1: " + string.Join(", " , Arr1));
            Console.WriteLine("Arr2: " + string.Join(", " , Arr2));
            Console.WriteLine("Element In Arr1 Not Subset Of Arr2: " + string.Join(", " , FindElementInArr1NotSubsetOfArr2(Arr1, Arr2)));



            Console.ReadLine();

        }
    }
}
