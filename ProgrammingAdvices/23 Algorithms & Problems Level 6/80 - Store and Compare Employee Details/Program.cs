using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _80___Store_and_Compare_Employee_Details
{
    internal class Program
    {
        static void Main()
        {
            var employee1 = (Name: "Alice", Salary: 50000);
            var employee2 = (Name: "Bob", Salary: 60000);

            Console.WriteLine($"{employee1.Name} has {(employee1.Salary > employee2.Salary ? "higher" : "lower")} salary than {employee2.Name}");

            Console.ReadKey();
        }
    }
}
