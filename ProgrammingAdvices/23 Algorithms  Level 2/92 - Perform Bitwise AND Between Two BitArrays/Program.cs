using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _92___Perform_Bitwise_AND_Between_Two_BitArrays
{
    internal class Program
    {
        static void Main(string[] args)
        {
            BitArray bits1 = new BitArray(8);
            bits1[0] = true;
            bits1[1] = true;
            bits1[3] = true;

            BitArray bits2 = new BitArray(8);
            bits2[1] = true;
            bits2[3] = true;
            bits2[7] = true;

            Console.Write("bits2       : ");
            foreach (var bit in bits1)
            {
                Console.Write(bit.Equals(true) ? "1" : "0");
            }
            Console.WriteLine();

            Console.Write("bits2       : ");
            foreach(var bit in bits2)
            {
                Console.Write(bit.Equals(true)?"1":"0");
            }
            Console.WriteLine();

            Console.Write("bits1 & bit2: ");
            var bit3 = bits1.And(bits2);
            foreach (var bit in bit3)
            {
                Console.Write(bit.Equals(true) ? "1" : "0");
            }
            Console.WriteLine();


            Console.ReadKey();
        }
    }
}
