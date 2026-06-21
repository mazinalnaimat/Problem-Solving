using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _29___Check_palindrome_using_a_stack
{
    internal class Program
    {
        static bool CheckPalindromUsingStack(in string Text)
        {
            if (Text.Length == 0)
            {
                return false;
            }
            Stack<char> stack = new Stack<char>();

            int MidPosition = Text.Length / 2;
            bool IsEvenTextLength = Text.Length % 2 == 0;

            if (IsEvenTextLength == true)
            {
                MidPosition--;
            }

            for (int i = 0; i <= MidPosition; i++)
            {
                if (!IsEvenTextLength && i == MidPosition)
                    continue;
                stack.Push(Text[i]);
            }

            for (int i = MidPosition + 1; i < Text.Length; i++)
            {
                if (stack.Count == 0)
                {
                    return false;
                }
                char CharStack = stack.Pop();
                if (CharStack != Text[i])
                    return false;




            }

            return true;
        }
        static void Main(string[] args)
        {
            string Text = "maaddaam";
            Console.WriteLine("Text: " + Text);

            if (CheckPalindromUsingStack(Text))
            {
                Console.WriteLine("The text is a palindrome");
            }
            else
            {
                Console.WriteLine("The text is not a palindrome");

            }


            Console.ReadLine();

        }
    }
}

