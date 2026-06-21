using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _32___Remove_Invalid_Parentheses
{
    internal class Program
    {
        static public bool RemoveInvalidParentheses( string Input, out string Output)
        {
            Output = "";

            Stack<char> CheckStack = new Stack<char>();
            Stack<char> LeftParentheses = new Stack<char>();
            Stack<char> RightParentheses = new Stack<char>();


            while (Input.Length > 0)
            {
                if (Input[0] == '(')
                {
                    CheckStack.Push(Input[0]);
                }
                else if (Input[0] == ')')
                {
                    if (CheckStack.Count > 0 && CheckStack.Peek() == '(')
                    {
                        LeftParentheses.Push(CheckStack.Pop());
                        RightParentheses.Push(Input[0]);

                    }

                }
                else
                {
                    return false;
                }

                    Input = Input.Remove(0, 1);

            }
             Output = new string(LeftParentheses.Concat(RightParentheses).ToArray());
            return true;

        }
        static void Main(string[] args)
        {
            string Input = "(((((((()))";
            string Output = "";
            Console.WriteLine("Input: " + Input);  
            if (RemoveInvalidParentheses(Input, out Output))
            {
                Console.WriteLine("Output: " + Output);

            }
            else
            {
                Console.WriteLine("The input is wrong!!!");

            }

            Console.ReadLine(); 

        }
    }
}
