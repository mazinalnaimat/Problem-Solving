using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _9___Implementing_Simple_Backtracking
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Stack<string> Tracks= new Stack<string>();
            Tracks.Push("Start");
            Tracks.Push("Go To Gaz Station");
            Tracks.Push("Go To Super Market");
            Tracks.Push("Go To Work");
            Tracks.Push("Go To Cafe");
            Tracks.Push("Go Home");

            Console.WriteLine(string.Join("-> ", Tracks.Reverse()));
            Console.WriteLine();
           Console.WriteLine("Backtracking...");

            while (Tracks.Count() > 0)
            {
                Console.WriteLine();

                Console.WriteLine("Back to: " + Tracks.Pop());
                Console.WriteLine();

            }

            Console.ReadLine();

        }
    }
}
