using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _91____Count_the_Number_of_True_Bits_And_Count_False_Bits_in_a_BitArray
{
    internal class Program
    {
        static (int TrueBitsNum, int FalseBitsNum) GetTrueNumAndFalseNumOfBitArray(BitArray bits)
        {
            int TrueBitsNum = 0, FalseBitsNum = 0;
            foreach (var bit in bits)
            {
                if (bit.Equals(true))
                {
                    TrueBitsNum++;
                }
                else
                {
                    FalseBitsNum++;
                }
            }

            return (TrueBitsNum, FalseBitsNum);
        }
        static void Main(string[] args)
        {
            BitArray bits = new BitArray(10, false);
            bits[0] = true;
            bits[4] = true;
            bits[5] = true;

            var bitsNum = GetTrueNumAndFalseNumOfBitArray(bits);


            Console.WriteLine("True bits Num: " + bitsNum.TrueBitsNum + ", False bits Num: " + bitsNum.FalseBitsNum);
            Console.ReadKey();
        }
    }
}
