using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _18___Rotate_a_Queue
{
    internal class Program
    {
        static Queue<int> RotateQueue(Queue<int> queue, int k)
        {
            for (int i = 0; i < k; i++)
            {
                queue.Enqueue(queue.Dequeue());
            }
            return queue;
        }
        static void Main(string[] args)
        {
            Queue<int> queue = new Queue<int>(new[] { 1, 2, 3, 4, 5 });
            Queue<int> rotatedQueue = RotateQueue(queue, 2);
            Console.WriteLine(string.Join(", ", rotatedQueue)); // Output: 3, 4, 5, 1, 2
            Console.ReadKey();
        }
    }
}
