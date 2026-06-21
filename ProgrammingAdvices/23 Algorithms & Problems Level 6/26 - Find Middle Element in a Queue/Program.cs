using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _26___Find_Middle_Element_in_a_Queue
{
    internal class Program
    {
        static int MidElementOfQueue(Queue <int> queue) 
        { 
            if (queue.Count == 0) 
                return default; 
            List<int> list = new List<int>(queue);
            int MidPosition = list.Count / 2; 
            if (list.Count % 2 == 0) 
            { 
                MidPosition--;
            } 
            return list[MidPosition];
        }

        static void Main(string[] args)
        {
            Queue <int> queue = new Queue<int>();
            queue.Enqueue(1);
            queue.Enqueue(2);
            queue.Enqueue(3);
            queue.Enqueue(4);
            queue.Enqueue(5);

            Console.WriteLine("Input Queue: " + string.Join(", ", queue));
            Console.WriteLine("Middle Elements is: " + MidElementOfQueue(queue));
            Console.ReadLine();
        }
    }
}
