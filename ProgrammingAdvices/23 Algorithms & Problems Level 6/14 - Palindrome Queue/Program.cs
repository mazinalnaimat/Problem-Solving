using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _14___Palindrome_Queue
{
    internal class Program
    {
        static public bool CheckPalindrome(Queue<int> Numbers)
        {
            Stack<int> ReverseNumbers = new Stack<int>(Numbers);

            int Counter = Numbers.Count / 2;
            while (Counter > 0)
            {
                if(ReverseNumbers.Pop()!= Numbers.Dequeue())
                    return false;
                Counter--;
            }

            return true;
        }
        static void Main(string[] args)
        {
            Queue<int> Numbers1 = new Queue<int>();
            Numbers1.Enqueue(1);
            Numbers1.Enqueue(2);
            Numbers1.Enqueue(3);
            Numbers1.Enqueue(2);
            Numbers1.Enqueue(1);

            Queue<int> Numbers2 = new Queue<int>();
            Numbers2.Enqueue(1);
            Numbers2.Enqueue(2);
            Numbers2.Enqueue(2);
            Numbers2.Enqueue(1);

            Queue<int> Numbers3 = new Queue<int>();
            Numbers3.Enqueue(2);
            Numbers3.Enqueue(2);
            Numbers3.Enqueue(2);
            Numbers3.Enqueue(1);

            Queue<int> Numbers4 = new Queue<int>();
            Numbers4.Enqueue(2);
            Numbers4.Enqueue(2);
            Numbers4.Enqueue(3);
            Numbers4.Enqueue(2);
            Numbers4.Enqueue(1);

            Console.WriteLine("Numbers1 : " + string.Join("," , Numbers1));
            Console.WriteLine("Is Palindrome: " + CheckPalindrome(Numbers1));
            Console.WriteLine();

            Console.WriteLine("Numbers2 : " + string.Join(",", Numbers2));
            Console.WriteLine("Is Palindrome: " + CheckPalindrome(Numbers2));
            Console.WriteLine();

            Console.WriteLine("Numbers3 : " + string.Join(",", Numbers3));
            Console.WriteLine("Is Palindrome: " + CheckPalindrome(Numbers3));
            Console.WriteLine();

            Console.WriteLine("Numbers4 : " + string.Join(",", Numbers4));
            Console.WriteLine("Is Palindrome: " + CheckPalindrome(Numbers4));
            Console.WriteLine();
        }
    }
}
