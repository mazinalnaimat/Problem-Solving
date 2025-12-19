using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Versioning;
using System.Text;
using System.Threading.Tasks;

namespace _13___Reverse_a_Queue
{
    internal class Program
    {
        static Queue<T> ReverseQueue<T>(Queue<T> Queue)
        {
            Stack <T> Stack = new Stack<T>();   

            while (Queue.Count > 0)
            {
                Stack.Push(Queue.Dequeue());
            }

            while (Stack.Count > 0)
            {
                Queue .Enqueue( Stack.Pop());
            }
            return Queue;
        }
        static void Main(string[] args)
        {

            Queue<int> queue = new Queue<int>();


            for (int i = 1; i < 6; i++)
            {
                queue.Enqueue(i);
            }

            Console.WriteLine("Ouput Queue: " + string.Join(", ", queue));


            queue = ReverseQueue<int>(queue);

     

            Console.WriteLine("Ouput Queue: " + string.Join(", ", queue));

            Console.ReadLine();

        }
    }
}
