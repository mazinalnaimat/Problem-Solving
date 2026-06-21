using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _15___Generate_Binary_Numbers_Using_Queue
{
    internal class Program
    {
        public static List<string> GenerateBinNum(int MaxNumber)
        {
            Queue<string> BinNumbersQueueToGenerate = new Queue<string>();
            List<string> BinNumbers = new List<string>();

            BinNumbersQueueToGenerate.Enqueue("1");

            for (int i = 1; i <= MaxNumber; i++)
            {
                string BinNumber = BinNumbersQueueToGenerate.Dequeue();
                BinNumbers.Add(BinNumber);

                BinNumbersQueueToGenerate.Enqueue(BinNumber + "0");
                BinNumbersQueueToGenerate.Enqueue(BinNumber + "1");

            }

            return BinNumbers;
        }

        static void Main(string[] args)
        {
            var BinNumbers = GenerateBinNum(10);

            Console.WriteLine("Binary Numbers from 0 To 10 :");
            Console.WriteLine("[" + string.Join(", ", BinNumbers) + "]");
        }
    }
  
}
