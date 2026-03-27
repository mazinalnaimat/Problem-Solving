using System;
using System.Collections.Generic;
using System.Text;

namespace HierarchicalEmployeeManagement
{
    public class EmployeeNode
    {
        public string Name { get; private set; }
        public string Position { get; private set; }
        public bool IsManager { get; private set; }

        private readonly List<EmployeeNode> _subordinates = new List<EmployeeNode>();
        public IReadOnlyList<EmployeeNode> Subordinates => _subordinates.AsReadOnly();

        public EmployeeNode(string name, string position, bool isManager = false)
        {
            Name = name ?? throw new ArgumentNullException(nameof(name));
            Position = position ?? throw new ArgumentNullException(nameof(position));
            IsManager = isManager;
        }

        public void AddSubordinate(EmployeeNode subordinate)
        {
            if (subordinate == null)
                throw new ArgumentNullException(nameof(subordinate));

            _subordinates.Add(subordinate);
        }

        private void PrintHierarchy(EmployeeNode employee, int depth)
        {
            string indent = new string('\t', depth);

            Console.WriteLine($"{indent}{employee.Position}: {employee.Name}");

            foreach (var subordinate in employee._subordinates)
            {
                PrintHierarchy(subordinate, depth + 1);
            }

            if (employee._subordinates.Count > 0)
            {
                Console.WriteLine();
            }
        }

        public void PrintHierarchy()
        {
            PrintHierarchy(this, 0);
        }

    }

    internal class Program
    {
        static void Main(string[] args)
        {
            EmployeeNode ceo = new EmployeeNode("Salim", "CEO", true);

            EmployeeNode vpInfra = new EmployeeNode("Mohammad", "VP of Infrastructure", true);
            ceo.AddSubordinate(vpInfra);
            vpInfra.AddSubordinate(new EmployeeNode("Hazem", "Role 1"));
            vpInfra.AddSubordinate(new EmployeeNode("Omer", "Role 2"));

            EmployeeNode vpProg = new EmployeeNode("Qutibeh", "VP of Programming", true);
            ceo.AddSubordinate(vpProg);
            vpProg.AddSubordinate(new EmployeeNode("Kamel", "Role 1"));
            vpProg.AddSubordinate(new EmployeeNode("Hasan", "Role 2"));

            EmployeeNode vpNet = new EmployeeNode("Tareq", "VP of Network", true);
            ceo.AddSubordinate(vpNet);
            vpNet.AddSubordinate(new EmployeeNode("Ali", "Role 1"));
            vpNet.AddSubordinate(new EmployeeNode("Radie", "Role 2"));

            ceo.PrintHierarchy();

            Console.ReadKey();
        }
    }
}