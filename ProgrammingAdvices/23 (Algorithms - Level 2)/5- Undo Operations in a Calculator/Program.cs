using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _5__Undo_Operations_in_a_Calculator
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Stack<int> CalResultHistory = new Stack<int>();
            CalResultHistory.Push(20);
            CalResultHistory.Push(25);
            CalResultHistory.Push(98);
            CalResultHistory.Push(45);

            Console.WriteLine("Undo: " + CalResultHistory.Pop() );
            Console.WriteLine("Current Result: " + CalResultHistory.Peek());




        }
    }
}
