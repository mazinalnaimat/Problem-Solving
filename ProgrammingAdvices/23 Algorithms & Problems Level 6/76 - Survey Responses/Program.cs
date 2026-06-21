using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _76___Survey_Responses
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string[][] ServeyResoposes = new string[5][];

            ServeyResoposes[0] = new string[] { "Yes", "No", "Yes"};
            ServeyResoposes[1] = new string[] { "Yes", "Yes"};
            ServeyResoposes[2] = new string[] { "No", "No", "No"};
            ServeyResoposes[3] = new string[] { "No", "Yes"};
            ServeyResoposes[4] = new string[] { "Yes", "Yes", "Yes", "Yes", "No"};

            Console.WriteLine("Servey Resposes:\n");
            for (int i = 0; i < ServeyResoposes.Length; i++)
            {
                Console.Write("Servey " + (i + 1)+ ": ");
                Console.WriteLine(String.Join(", ", ServeyResoposes[i]));
            }


            Console.ReadKey();
        }
    }
}
