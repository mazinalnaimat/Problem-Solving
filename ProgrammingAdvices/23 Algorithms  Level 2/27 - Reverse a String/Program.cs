using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _27___Reverse_a_String
{
    internal class Program
    {
        static public bool ReverseStringUsingStack(string Text, out string ReverseText)
        {
            if (Text.Length == 0)
            {
                ReverseText = string.Empty;
                return false;
            }
            Stack<char> stack = new Stack<char>(Text);
            ReverseText = string.Join("", stack);
            return true;
        }
        static void Main(string[] args)
        {
            string Text = "Hello";
            string ReverseText = "";

            Console.WriteLine("Text: " + Text);

            if (ReverseStringUsingStack(Text, out ReverseText))
            {
                Console.WriteLine("Reverse Text: " + ReverseText);
            }
            else
            {
                Console.WriteLine("There Is An Error!!!!");
            }
            Console.ReadLine();
        }
    }
}
