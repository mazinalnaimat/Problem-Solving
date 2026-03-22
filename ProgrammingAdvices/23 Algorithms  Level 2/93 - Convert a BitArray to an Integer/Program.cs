using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _93___Convert_a_BitArray_to_an_Integer
{
    internal class Program
    {
        static int ConvertBitArrayToInt(BitArray bits)
        {
            int Num = 0;
            for (int i = 0; i < bits.Length; i++)
            {
                Num += (int)Math.Pow(2, i) * Convert.ToInt32(bits[i]);
            }
            return Num;
        }
        static void Main(string[] args)
        {
            BitArray bits1 = new BitArray(12);
            bits1[2] = true;
            bits1[6] = true;
            bits1[10] = true;

            Console.WriteLine("bits1 as int: " + ConvertBitArrayToInt(bits1));

            Console.ReadKey();
        }
    }
}
