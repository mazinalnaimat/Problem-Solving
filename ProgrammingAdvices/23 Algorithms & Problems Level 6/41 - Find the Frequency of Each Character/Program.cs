using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _41___Find_the_Frequency_of_Each_Character
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string Text = "Hello";

            Console.WriteLine("Input: " + Text);
            Dictionary<char, int> FrqChars = new Dictionary<char, int>();

            while (Text.Length > 0)
            {
                if (FrqChars.ContainsKey(Text[0]))
                {
                    FrqChars[Text[0]]++;
                }
                else 
                {
                    FrqChars.Add(Text[0],1);
                }
                Text = Text.Substring(1);
            }

            Console.Write("{ ");
            foreach (var FrqChar in FrqChars)
            {
                Console.Write("\'" + FrqChar.Key + "\'" + " : "  + FrqChar.Value + ", ");
            }
            Console.WriteLine("}");

            Console.ReadLine();
        }
    }
}
