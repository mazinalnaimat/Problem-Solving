using System;
using System.Collections.Generic;

namespace StackCalculator
{
    internal class Program
    {
        // Define priority: Higher number = Higher priority
        static int GetPriority(char op)
        {
            if (op == '+' || op == '-') return 1;
            if (op == '*' || op == '/') return 2;
            return 0;
        }

        static int ApplyOp(int a, int b, char op)
        {
            switch (op)
            {
                case '+': return a + b;
                case '-': return a - b;
                case '*': return a * b;
                case '/': return a / b;
                default: return 0;
            }
        }

        static int Evaluate(string expression)
        {
            Stack<int> values = new Stack<int>();
            Stack<char> ops = new Stack<char>();

            for (int i = 0; i < expression.Length; i++)
            {
                // 1. Skip spaces
                if (expression[i] == ' ') continue;

                // 2. If it's a number, parse the whole thing and push to values
                if (char.IsDigit(expression[i]))
                {
                    string s = "";
                    while (i < expression.Length && char.IsDigit(expression[i]))
                    {
                        s += expression[i++];
                    }
                    values.Push(int.Parse(s));
                    i--; // adjust for loop increment
                }
                // 3. Handle Parentheses
                else if (expression[i] == '(') ops.Push('(');
                else if (expression[i] == ')')
                {
                    while (ops.Peek() != '(')
                        values.Push(ApplyOp(values.Pop(), values.Pop(), ops.Pop()));
                    ops.Pop(); // Pop '('
                }
                // 4. Handle Operators
                else
                {
                    // While top of 'ops' has same or higher priority to current op
                    while (ops.Count > 0 && GetPriority(ops.Peek()) >= GetPriority(expression[i]))
                    {
                        int val2 = values.Pop();
                        int val1 = values.Pop();
                        char op = ops.Pop();
                        values.Push(ApplyOp(val1, val2, op));
                    }
                    ops.Push(expression[i]);
                }
            }

            // 5. Finalize remaining operations
            while (ops.Count > 0)
            {
                int val2 = values.Pop();
                int val1 = values.Pop();
                char op = ops.Pop();
                values.Push(ApplyOp(val1, val2, op));
            }

            return values.Pop();
        }

        static void Main()
        {
            Console.WriteLine("Result: " + Evaluate("10 + 2 * 6")); // Should be 22, not 72
            Console.ReadLine();
        }
    }
}