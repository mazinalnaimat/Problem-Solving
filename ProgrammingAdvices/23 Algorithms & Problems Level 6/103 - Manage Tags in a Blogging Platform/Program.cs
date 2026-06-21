


using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _103___Manage_Tags_in_a_Blogging_Platform
{
    internal class Program
    {

        static void Main()
        {
            SortedSet<string> tags = new SortedSet<string>
        {
            "C#", "Programming", "Tutorial", "DotNet"
        };

            // Add more tags
            tags.Add("Coding");
            tags.Add("Programming"); // Duplicate, won't be added

            Console.WriteLine("All Tags:");
            foreach (var tag in tags)
            {
                Console.WriteLine(tag);
            }

            Console.WriteLine("Press any key to exit...");
            Console.ReadKey();
        }
    }
}
