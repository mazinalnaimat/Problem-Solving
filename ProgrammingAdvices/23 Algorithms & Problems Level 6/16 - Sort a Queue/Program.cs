using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _16___Sort_a_Queue
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Queue<int> queue = new Queue<int>();
            queue.Enqueue(5);
            queue.Enqueue(1);   
            queue.Enqueue(3);
            queue.Enqueue(2);
            queue.Enqueue(4);

            Console.WriteLine("Input Queue : " 
                                + string.Join(", " , queue) );

            List<int> list = new List<int>(queue);

            list.Sort();
             queue = new Queue<int>(list);


            Console.WriteLine("Sorted Queue: "
                                + string.Join(", ", queue));



        }
    }
}
