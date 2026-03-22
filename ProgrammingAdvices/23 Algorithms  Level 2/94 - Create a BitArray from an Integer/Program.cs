using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _94___Create_a_BitArray_from_an_Integer
{
    internal class Program
    {
        static BitArray ConvertIntToBitArray(int Num)
        {
            BitArray bits = new BitArray(32);

            for (int i = 31; i > -1; i--)
            {
                bits[i] = Convert.ToBoolean(Num & (1 << i));
            }

            return bits;
        }
        static void Main(string[] args)
        {
            int Num = 120;

            BitArray NumInBits = ConvertIntToBitArray(Num);

            Console.WriteLine("Num: " + Num);
            Console.Write("Num In Bits: ");
            for (int i= NumInBits.Length-1; i>-1; i--)
            {
                Console.Write(NumInBits[i].Equals(true)?"1": "0");
            }

            Console.ReadKey();

        }
    }
}
