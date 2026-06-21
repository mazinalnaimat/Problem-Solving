using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _35___Translate_Words_Between_Languages
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Dictionary<string, string> EnglishSpanishDic = new Dictionary<string, string >();

            EnglishSpanishDic.Add("Hello", "Hola");
            EnglishSpanishDic.Add("Goodbye ", "Adiós");

            foreach (var Word in EnglishSpanishDic)
            {
                Console.WriteLine(Word.Key + " in Spanish: " +Word.Value);


            }

            Console.ReadLine();
        }
    }
}
