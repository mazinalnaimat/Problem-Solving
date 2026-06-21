using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

namespace _33___Store_and_Retrieve_Student_Grades
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Dictionary<string, int> Grades= new Dictionary<string, int>();

            Grades.Add("Salim", 64);
            Grades.Add("Omer", 97);
            Grades.Add("Ra'ed", 93);
            Grades.Add("Hatem", 85);
            Grades.Add("Osaid", 96);

            foreach (var Grade in Grades)
            {
                Console.WriteLine("Student: " + Grade.Key + ", Grade: " + Grade.Value);
            }
            Console.ReadLine();
        }
    }
}
