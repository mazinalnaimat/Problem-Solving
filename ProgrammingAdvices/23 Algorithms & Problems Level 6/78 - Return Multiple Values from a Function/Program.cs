using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _78___Return_Multiple_Values_from_a_Function
{
    internal class Program
    {

        static (string Name, int Age, double Grade) GetStudentInfo()
        {
            return ("Salim", 16, 92.5);
        }
        static void Main(string[] args)
        {
            var StudentInfo = GetStudentInfo();

            Console.WriteLine($"Name: {StudentInfo.Name}, Age: {StudentInfo.Age}, Grade: {StudentInfo.Grade}");

            Console.ReadKey();
        }
    }
}
