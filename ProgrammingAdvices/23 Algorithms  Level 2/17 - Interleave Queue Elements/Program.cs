using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _17___Interleave_Queue_Elements
{
    internal class Program
    {
         static public Queue<T> InterleaveQueueElemnets<T>(Queue <T> Queue)
        {
            Stack<T> InterleaveStack = new Stack<T>();
            bool IsQueueLengthEven = Queue.Count % 2 == 0;
            int MidPosition = Queue.Count / 2;

            if (!IsQueueLengthEven)
            {
                MidPosition++;
            }

            Stack<T> LeftPartOfQueue = new Stack<T>();
            for (int i = 0; i < MidPosition; i++)
            {
                LeftPartOfQueue.Push(Queue.Dequeue());
            }

            Stack <T> RightPartOfQueue  = new Stack<T>(Queue);

            if (IsQueueLengthEven)
            {
                for (int i = 0; i < MidPosition ; i++)
                {
                    InterleaveStack.Push(RightPartOfQueue.Pop());
                    InterleaveStack.Push(LeftPartOfQueue.Pop());

                }
            }
            else 
            {
                for (int i = 0; i < MidPosition - 1; i++)
                {
                    InterleaveStack.Push(LeftPartOfQueue.Pop());
                    InterleaveStack.Push(RightPartOfQueue.Pop());

                }
            }

             

            if (LeftPartOfQueue.Count > 0)
            {
                InterleaveStack.Push(LeftPartOfQueue.Pop());

            }
            return new Queue<T>(InterleaveStack);

        }
        static void Main(string[] args)
        {
            Queue <int> queue = new Queue<int>();
            queue.Enqueue(1);
            queue.Enqueue(2);
            queue.Enqueue(3);
            queue.Enqueue(4);
            queue.Enqueue(5);
            queue.Enqueue(6);

            Console.WriteLine("Input Queue     : " + string.Join(", ", queue));
            queue = InterleaveQueueElemnets<int>(queue);
            Console.WriteLine("Interleave Queue: " + string.Join(", ", queue));
            Console.ReadLine();

        }
    }
}
