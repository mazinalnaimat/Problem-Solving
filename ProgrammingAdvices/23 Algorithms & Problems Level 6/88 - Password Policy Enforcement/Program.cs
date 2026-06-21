using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _88___Password_Policy_Enforcement
{
    internal class Program
    {

        static void Main()
        {
            BitArray passwordPolicy = new BitArray(4); // Uppercase, Lowercase, Digit, Special Character


            string password = "Password123!";
            passwordPolicy[0] = password.Any(char.IsUpper); // Uppercase
            passwordPolicy[1] = password.Any(char.IsLower); // Lowercase
            passwordPolicy[2] = password.Any(char.IsDigit); // Digit
            passwordPolicy[3] = password.Any(ch => "!@#$%^&*".Contains(ch)); // Special Character


            bool isValid = passwordPolicy.Cast<bool>().All(bit => bit);
            Console.WriteLine($"Password Valid: {isValid}");
            Console.ReadKey();

        }
    }
}
