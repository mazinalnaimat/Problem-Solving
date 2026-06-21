using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _40___Dynamic_Skill_Matching
{
    internal class Program
    {
        static void Main(string[] args)
        {
            HashSet<string> JobRequirements = new HashSet<string>();
            JobRequirements.Add("C#");
            JobRequirements.Add("SQL");
            JobRequirements.Add("JavaScript");

            Stack <string> CandidateSkills = new Stack<string>();
            CandidateSkills.Push("C#");
            CandidateSkills.Push("JavaScript");
            CandidateSkills.Push("React");

            Console.WriteLine("Candidate Skills: " + string.Join(", ", CandidateSkills));
            Console.WriteLine();


            Console.WriteLine("Job Requirements: " + string.Join(", ", JobRequirements));
            Console.WriteLine();


            HashSet<string> MatchingSkills = new HashSet<string>();

            while (CandidateSkills.Count > 0)
            {
                if (JobRequirements.Add(CandidateSkills.Peek()) == false)
                {
                    MatchingSkills.Add(CandidateSkills.Peek());
                }
                CandidateSkills.Pop();
            }

        



            Console.WriteLine("Matching Skills: " + string.Join(", ", MatchingSkills));
            Console.WriteLine();

            Console.ReadLine();
        }
    }
}
