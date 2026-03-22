using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _87___Password_Strength_Checker
{
    internal class Program
    {
        static bool CheckPasswordStrength(string Password)
        {
            BitArray CheckBits = new BitArray(4);

            foreach (char c in Password)
            {
                if (char.IsLower(c))
                    CheckBits[0] = true;

                else if (char.IsUpper(c))
                    CheckBits[1] = true;

                else if (char.IsDigit(c))
                    CheckBits[2] = true;

                else
                    CheckBits[3] = true; // special character
            }

            // AND all bits
            bool Result = true;
            foreach (bool bit in CheckBits)
            {
                Result &= bit;
            }

            return Result;
        }
        static void Main(string[] args)
        {
            string Pass1 = "adfds123";
            string Pass2 = "sdf342!e%A";
            string Pass3 = "adfds#a234";

            Console.WriteLine("Password 1: " + Pass1 + ", " + (CheckPasswordStrength(Pass1)? "Strong":"Week"));
            Console.WriteLine("Password 2: " + Pass2 + ", " + (CheckPasswordStrength(Pass2)? "Strong":"Week"));
            Console.WriteLine("Password 3: " + Pass3 + ", " + (CheckPasswordStrength(Pass3)? "Strong":"Week"));

            Console.ReadKey();

        }
    }
}
