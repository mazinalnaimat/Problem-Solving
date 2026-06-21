using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _104___Autocomplete_Suggestions_in_a_Search_Feature
{
    internal class Program
    {
        static void Main()
        {
            SortedSet<string> words = new SortedSet<string>
        {
            "apple", "application", "appreciate", "banana", "band", "bandwidth", "cat", "cater"
        };

            Console.Write("Enter a prefix: ");
            string prefix = Console.ReadLine();

            var suggestions = GetSuggestions(words, prefix);

            Console.WriteLine("Suggestions:");
            foreach (var word in suggestions)
            {
                Console.WriteLine(word);
            }

            Console.WriteLine("Press any key to exit...");
            Console.ReadKey();
        }

        static IEnumerable<string> GetSuggestions(SortedSet<string> words, string prefix)
        {
            foreach (var word in words)
            {
                if (word.StartsWith(prefix, StringComparison.OrdinalIgnoreCase))
                {
                    yield return word;
                }
            }
        }
    }
}
