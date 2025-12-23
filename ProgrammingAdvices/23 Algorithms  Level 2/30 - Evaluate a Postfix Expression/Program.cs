using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace _30___Evaluate_a_Postfix_Expression
{
    internal class Program
    {
        static int Calculate(in int Num1, in int Num2, in char Operator)
        {
            switch (Operator)
            {
                case '+':
                    return Num1 + Num2;

                case '-':
                    return Num1 - Num2;

                case '*':
                    return Num1 * Num2;

                case '/':
                    return Num2 == 0 ? 0 : Num1 / Num2;
            }

            return 0;
        }
        static bool EvaluatePostfixExpression(in string Expression, out int Result)
        {
            string ValidChars = "0123456789+-*/";
            string Numbers = "0123456789";
            if (Expression.Length == 0)
            {
                Result = 0;
                return false;
            }
            if (!Numbers.Contains(Expression[0]) && Expression[0] != '-')
            {
                Result = 0;
                return false;
            }
            int NumberCount = 0, OperatorCount = 0;
            foreach (char Char in Expression)
            {
                if (Numbers.Contains(Char))
                {
                    NumberCount++;
                }
                else
                {
                    OperatorCount++;
                }
            }



            if (NumberCount - 1 != OperatorCount)
            {
                if (!(NumberCount == OperatorCount && Expression[0] == '-'))
                {       Result = 0;
                  return false;
                 }
            }


            Stack<int> stack = new Stack<int>();

            for (int i = 0; i < Expression.Length; i++)
            {
                char Char = Expression[i];
                if (!ValidChars.Contains(Char))
                {
                    Result = 0;
                    return false;
                }
                if (Numbers.Contains(Char))
                {
                    stack.Push(Expression[i] - '0');
                }
                else
                {
                    if (Char == '-' && i + 1 < Expression.Length && Numbers.Contains(Expression[i + 1]))
                    {
                        stack.Push(-(Expression[i + 1] - '0')); 
                        i++;
                        continue;
                    }

                    int Num1 = 0;
                    int Num2 = stack.Pop();
                    Num1 = stack.Pop();
                    stack.Push((Calculate(Num1, Num2, Expression[i])));
                }
            }

            Result = stack.Pop();
            return true;

        }
        static void Main(string[] args)
        {
            string Expression = "231*+9*";
            int Result = 0;
            Console.WriteLine("Expression: " + Expression);

            if (EvaluatePostfixExpression(in Expression, out Result))
            {
                Console.WriteLine("Result: " + Result);
            }
            else
            {
                Console.WriteLine("The Expression Is Wrong!!!");
            }
            Console.ReadLine();
        }
    }
}
