using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _23___Implement_a_Priority_Queue
{
    internal class Program
    {
        class PriorityQueue<TValue>
        {
            private SortedList<int, TValue> sortedList = new SortedList<int, TValue>();

            public void Enqueue(TValue Item, int Priority)
            {
                if (sortedList.ContainsKey(Priority))
                {
                    sortedList[Priority] = Item;
                }
                else
                { 
                    sortedList.Add(Priority, Item);
                } 
            }
            public  TValue Dequeue()
            {
                if (sortedList.Count == 0) return default(TValue);
                TValue HeigestPriorityItem = sortedList.Values.Last();
                sortedList.Remove(sortedList.Keys.Last());
                 return HeigestPriorityItem;
            }

            public bool IsEmpty()
            {
                return sortedList.Count == 0; 
            }

        }
        static void Main(string[] args)
        {
            PriorityQueue<int> priorityQueue = new PriorityQueue<int>();
            priorityQueue.Enqueue(10, 2);
            priorityQueue.Enqueue(65, 1);
            priorityQueue.Enqueue(34, 6);

         

            Console.WriteLine(priorityQueue.Dequeue());
            Console.WriteLine(priorityQueue.Dequeue());
            Console.ReadLine();
        }
    }
}
