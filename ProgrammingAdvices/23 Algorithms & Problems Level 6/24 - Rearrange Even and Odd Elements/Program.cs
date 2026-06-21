using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace _24___Rearrange_Even_and_Odd_Elements
{
    internal class Program
    {
        static public Queue<int> EvenOddQueue(Queue <int> Queue)
        {
            Queue <int> EvenQueue  = new Queue<int>();  
            Queue <int> OddQueue  = new Queue<int>();

            while (Queue.Count > 0)
            {
                if (Queue.Peek() % 2 == 0)
                {
                    EvenQueue.Enqueue(Queue.Dequeue());
                }
                else
                {
                    OddQueue.Enqueue(Queue.Dequeue());

                }
            }
            return new Queue<int>(EvenQueue.Concat(OddQueue));
            
        }
        static void Main(string[] args)
        {
            Queue<int> Queue = new Queue<int>();
            Queue.Enqueue(1);
            Queue.Enqueue(2);   
            Queue.Enqueue(3);
            Queue.Enqueue(4);
            Queue.Enqueue(5);
            Queue.Enqueue(6);

            Console.WriteLine("Input Queue   : " + string.Join(", ", Queue));

            Queue = EvenOddQueue(Queue);
            Console.WriteLine("Even Odd Queue: " + string.Join(", ", Queue));

            Console.ReadLine(); 



        }
    }
}
