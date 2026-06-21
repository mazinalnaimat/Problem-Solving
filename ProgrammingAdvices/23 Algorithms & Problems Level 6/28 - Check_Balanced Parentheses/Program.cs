using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;

namespace _28___Check_Balanced_Parentheses
{
    internal class Program
    {
        static bool CheckBalancedParentheses(in string Parentheses)
        {
            if (Parentheses.Length == 0 || Parentheses.Length % 2 != 0)
                return false;
            Stack<char> stack = new Stack<char>();
            int MidPosition = Parentheses.Length / 2 - 1;
            for (int i = 0; i <= MidPosition; i++)
            {
                stack.Push(Parentheses[i]);
            }

            for (int i = MidPosition + 1; i < Parentheses.Length; i++)
            {
                if (stack.Count == 0)
                {
                    return false;
                }
                char StackParenthese = stack.Pop();

                if (StackParenthese == '(' && Parentheses[i] != ')')
                    return false;

                else if (StackParenthese == '[' && Parentheses[i] != ']')
                    return false;
                else if (StackParenthese == '{' && Parentheses[i] != '}')
                    return false;



            }

            return true;
        }
        static void Main(string[] args)
        {
            string Parentheses = "((({[]})))";
            Console.WriteLine("Parentheses: " + Parentheses);
            if (CheckBalancedParentheses(Parentheses))
            {
                Console.WriteLine("Balacend");
            }
            else
            {
                Console.WriteLine("Not Balanced");

            }
            Console.ReadLine();
        }
    }
}

