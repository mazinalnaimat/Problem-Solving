using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3___Implement_Browser_Back_Button
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Stack <string> Pages = new Stack<string>();
            Pages.Push("Page1");
            Pages.Push("Page2");
            Pages.Push("Page3");

            string  PreviousPage =  Pages.Pop();

            Console.WriteLine("Current Page : " + Pages.Peek());
            Console.WriteLine("Previous Page: " + PreviousPage);
            Console.ReadLine();


        }
    }
}
