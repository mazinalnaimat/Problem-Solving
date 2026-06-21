using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _36___Count_Word_Frequencies_in_a_Text
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string text = "hello world hello universe";
            Dictionary<string, int> wordCount = new Dictionary<string, int>();


            foreach (var word in text.Split(' '))
            {
                if (wordCount.ContainsKey(word))
                    wordCount[word]++;
                else
                    wordCount[word] = 1;
            }

            foreach (var word in wordCount)
            {
                Console.WriteLine($"{word.Key}: {word.Value}");
            }
            Console.ReadKey();

          
        }
    }
}
