using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _25____Clone_a_Queue_Without_Using_Extra_Space
{
    internal class Program
    {      

        
        static Queue<T> CloneQueue<T>(Queue<T> queue, Queue <T> clone)
        {
            if (queue == null || queue.Count == 0)
            {
                return new Queue<T>();
            }
            T front = queue.Dequeue();
            clone = CloneQueue(queue, clone);
            queue.Enqueue(front);
            clone.Enqueue(front);
            return clone;
            
        }
        static Queue<T> CloneQueue<T>(Queue<T> queue)
        {
            if (queue == null || queue.Count == 0)
            {
                return new Queue<T>();
            }
            Queue<T> clone = new Queue<T>();
            queue = new Queue<T>(queue.Reverse());
            return CloneQueue(queue, clone);
           
  
        }


        static void Main()
        {
            Queue<int> queue = new Queue<int>(new[] { 1, 2, 3, 4 });
            Queue<int> clonedQueue = CloneQueue(queue);
            Console.WriteLine(string.Join(", ", clonedQueue)); // Output: 1, 2, 3, 4
            Console.WriteLine(string.Join(", ", queue)); // Output: 1, 2, 3, 4
            Console.ReadKey();

        }
    }
}
