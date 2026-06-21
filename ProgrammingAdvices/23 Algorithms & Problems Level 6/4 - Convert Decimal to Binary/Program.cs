using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _4___Convert_Decimal_to_Binary
{
    internal class Program
    {
        static string DecimalToBinary(int DecimalNumber) 
         {
            Stack<int> Binary = new Stack<int>();

            while (DecimalNumber > 0)
            {

                Binary.Push(DecimalNumber % 2);

                DecimalNumber /= 2;
            }
            return string.Join("", Binary);
         }

        static void Main(string[] args)
        {
            int DecimalNumber = 0;
            Console.Write("Enter Decimal Number: ");
            DecimalNumber = Convert.ToInt32(Console.ReadLine());
            string BinaryNumber = DecimalToBinary(DecimalNumber);

            Console.WriteLine("The number in binary: " + BinaryNumber);
          
            Console.ReadLine();


        }
    }
}
