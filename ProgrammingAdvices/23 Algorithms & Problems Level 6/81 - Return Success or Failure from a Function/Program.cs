using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _81___Return_Success_or_Failure_from_a_Function
{
    internal class Program
    {
        static(bool Status, int Mark) CheckIfStudentPass(int Mark)
        {
            return Mark > 49 ? (true, Mark) : (false, Mark);
        }
        static void Main(string[] args)
        {
            var Student1 = CheckIfStudentPass(36);
            Console.WriteLine("Student1: Mark: " + Student1.Mark + ", Status: " + ( Student1.Status == true ?  "Pass" :"Fail"));
            Console.WriteLine();

            var Student2 = CheckIfStudentPass(51);
            Console.WriteLine("Student2: Mark: " + Student2.Mark + ", Status: " + ( Student2.Status == true ?  "Pass" :"Fail"));
            Console.WriteLine();

            var Student3 = CheckIfStudentPass(80);
            Console.WriteLine("Student3: Mark: " + Student3.Mark + ", Status: " + ( Student3.Status == true ?  "Pass" :"Fail"));
            Console.WriteLine();


            Console.ReadKey();
        }
    }
}
