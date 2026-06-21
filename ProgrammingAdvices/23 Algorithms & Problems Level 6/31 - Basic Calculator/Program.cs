using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Runtime;
using System.Runtime.Remoting.Services;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace _31___Basic_Calculator
{
    internal class Program
    {
        static int CalculateOneOperatorInExpression(ref string Expression, char Operator)
        {
            string Operators = "+-*/";
            int Result = 0;
            int OperatorPosition = 0;
            if (Expression.Length>2)
                OperatorPosition = Expression.Substring(1).IndexOf(Operator) +1;
            int Left = OperatorPosition - 1;
            int Right = OperatorPosition + 1;
            string LeftNum = "", RightNum = "";
            int LeftNumSign = 1;
            int RightNumSign = 1;
            bool IsAddLeftSign = false;
            bool IsAddRightSign = false;
            bool IsCompleteReadLeftAfterGetItsSign = false;
            bool IsCompleteReadRgihtAfterGetItsSign = false;

            while (true)
                {
                    bool IsAddNum = false;
                    bool IsAddCharToLeft = false;
                    bool  IsAddCharToRight = false;
                if (Left > -1 && !IsCompleteReadLeftAfterGetItsSign)
                {
                    if (!Operators.Contains(Expression[Left]))
                    {
                        LeftNum = Expression[Left] + LeftNum;
                        IsAddNum = true;
                        Left--;
                    }
                    else if ((Expression[Left] == '+' || Expression[Left] == '-') && !IsAddLeftSign && LeftNum.Length >= 0)
                    {
                        if (Expression[Left] == '+')
                            LeftNumSign = 1;
                        else
                            LeftNumSign = -1;
                        IsAddLeftSign = true;
                        IsAddCharToLeft = true;
                        Left--;

                        if (LeftNum.Length > 0)
                        {
                            IsCompleteReadLeftAfterGetItsSign = true;
                        }
                    }
                }



                if (Right < Expression.Length && !IsCompleteReadRgihtAfterGetItsSign)
                {
                    if ( !Operators.Contains(Expression[Right]))
                    {
                        RightNum = RightNum + Expression[Right];
                        IsAddNum = true;
                        Right++;

                    }

                    else if ((Expression[Right] == '+' || Expression[Right] == '-') && !IsAddRightSign && RightNum.Length==0)
                    {
                        if (Expression[Right] == '+')
                            RightNumSign = 1;
                        else
                            RightNumSign = -1;
                        IsAddRightSign = true;
                        IsAddCharToRight = true;
                        if (RightNum.Length > 0)
                        {
                            IsCompleteReadRgihtAfterGetItsSign = true;
                        }
                      

                        Right++;
                        
                    }
                }


                if (IsAddNum == false && IsAddCharToLeft == false && IsAddCharToRight == false)
                {
                    break;
                }
            }

            if ((Operator == '*' || Operator == '/') && IsCompleteReadLeftAfterGetItsSign)
            {

                Expression = Expression.Insert(Left+1, "+");

                Right++;
                Left++;
            }

            switch (Operator)
            {
                case '*':
                    Result = LeftNumSign * Convert.ToInt32(LeftNum) * RightNumSign * Convert.ToInt32(RightNum);
                    break;
                case '/':
                    Result = LeftNumSign * Convert.ToInt32(LeftNum) / (RightNumSign *  Convert.ToInt32(RightNum));
                    break;
                case '+':
                    if (LeftNum == "")
                        Result = 0 + RightNumSign * Convert.ToInt32(RightNum);
                    else
                        Result = LeftNumSign * Convert.ToInt32(LeftNum) + RightNumSign * Convert.ToInt32(RightNum);
                    break;
                case '-':      
                    if(LeftNum =="")
                        Result = 0 - RightNumSign * Convert.ToInt32(RightNum);
                    else
                        Result = LeftNumSign * Convert.ToInt32(LeftNum) - RightNumSign * Convert.ToInt32(RightNum);
                    break;
            }

            Expression = Expression.Insert(Right, Convert.ToString(Result));
            Right--;
            Left++;
           Expression = Expression.Remove(Left, Right - Left + 1);
            return Result;

        }
        static public int CalculateSimpleExpression(string SimpleExpression)
        {
            if (!SimpleExpression.Contains("*") && !SimpleExpression.Contains("/") && !SimpleExpression.Contains("+") &&  !SimpleExpression.Contains("-"))

            {
              return Convert.ToInt32(SimpleExpression);
            }
            int Result = 0;
            if (SimpleExpression[0] == '-' || SimpleExpression[0] == '+')
            {
                try
                {
                    return int.Parse(SimpleExpression);

                }
                catch 
                {
                    
                }
            }
             while ( SimpleExpression.Contains("*") || SimpleExpression.Contains("/") || SimpleExpression.Substring(1).Contains("+") || SimpleExpression.Substring(1).Contains("-"))
            {
                if (SimpleExpression.IndexOf('*') != -1  || SimpleExpression.IndexOf('/') != -1 )
                {
                    int MulPosition = SimpleExpression.IndexOf('*');
                    int DivPosition = SimpleExpression.IndexOf('/');
                    if (MulPosition > -1 && (DivPosition > -1 ? (MulPosition < DivPosition ? true:false):true))
                    {
                        Result = CalculateOneOperatorInExpression(ref SimpleExpression, '*');
                    }

                    else 
                    {
                        Result = CalculateOneOperatorInExpression(ref SimpleExpression, '/');
                    }
                }
                else if (SimpleExpression.IndexOf('+') != -1 || SimpleExpression.IndexOf('-') != -1)
                {
                    int AddPosition = SimpleExpression.Substring(1).IndexOf('+');
                    int SubPosition = SimpleExpression.Substring(1).IndexOf('-');
                    if (AddPosition > -1 && (SubPosition > -1 ? (AddPosition < SubPosition ? true : false) : true))
                    {
                        Result = CalculateOneOperatorInExpression(ref SimpleExpression, '+');
                    }

                    else 
                    { 
                        Result = CalculateOneOperatorInExpression(ref SimpleExpression, '-');
                    }
                }
             
            }
           
               

                return Result;

        }
        static public bool CalculateExpression(string Expression, out int Result)
        {
           
                string Opertators = "+-*/";
                string Parentheses = "()";
                Expression = "(" + Expression + ")";
                Result = 0;
                if (Expression.Length == 0)
                {
                    return false;
                }
                Stack<char> stack = new Stack<char>();

                Expression = Expression.Replace(" ", "");
               try
               {
                    for (int i = 0; i < Expression.Length; i++)
                    {
                        if (!Char.IsDigit(Expression[i]) && !Opertators.Contains(Expression[i]) && !Parentheses.Contains(Expression[i]) && Expression[i] != ' ')
                        {
                            return false;
                        }



                        if (Expression[i] == ')')
                        {
                            string InternalExpression = "";

                            string StringResultOfInternalExpression = "";
                            while (stack.Peek() != '(')
                            {
                                InternalExpression = (stack.Peek()) + InternalExpression;
                                stack.Pop();
                            }

                            StringResultOfInternalExpression = CalculateSimpleExpression(InternalExpression).ToString();

                            stack.Pop(); // Pop '('
                            while (StringResultOfInternalExpression.Length > 0)
                            {
                                stack.Push(StringResultOfInternalExpression[0]);
                                StringResultOfInternalExpression = StringResultOfInternalExpression.Remove(0, 1);
                            }

                            continue;
                        }
                        stack.Push(Expression[i]);


                    }

                    string StringResult = "";
                    while (stack.Peek() == ')')
                    {
                        stack.Pop();

                    }

                    while (stack.Count > 0 && stack.Peek() != '(')
                    {
                        StringResult = stack.Pop() + StringResult;

                    }
                    Result = Convert.ToInt32(StringResult);
               }
               catch (Exception e)
               {
                    return false;
               }
            

                return true;
        

        }
        static void Main(string[] args)
        {
            bool Close = false;
            while (!Close)
            {
                Console.Write("Enter The Expression: ");
                string Expression = Console.ReadLine();
                int Result = 0;

                Console.WriteLine("Expression: " + Expression);

                if (CalculateExpression(Expression, out Result))
                {
                    Console.WriteLine("Result: " + Result);
                }
                else
                {
                    Console.WriteLine("The Expression Is Worng!!!!!!!!!!! Try Agian");
                    Console.WriteLine("____________________________________________________________\n");

                    continue;
                }
                Console.WriteLine("____________________________________________________________\n");

                while (true)
                {
                    Console.Write("Do You want more again Y/N? ");
                    string EnterChar = Console.ReadLine();
                    if (EnterChar.ToUpper() == "Y")
                    {
                        Close = false;
                        Console.WriteLine();
                        break;
                    }
                    else if (EnterChar.ToUpper() == "N")
                    {
                        Close = true;
                        break;
                    }
                    
                }

            }
            Console.Write("Enter any key To Close");

            Console.ReadLine();

        }
    }
}
