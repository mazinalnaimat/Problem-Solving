using Microsoft.Win32;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _84___User_Survey_Results
{
    internal class Program
    {
        static BitArray CreateUser(params bool[] Answers)
        {
            return new BitArray(Answers);
        }
        static void Main()
        {
            // 5 questions * 3 users
            List<BitArray> UsersResponses = new List<BitArray>();

            UsersResponses.Add(CreateUser(true, false, true, true, false));
            UsersResponses.Add(CreateUser(true, true, true, true, false));
            UsersResponses.Add(CreateUser(false, false, false, true, false));


            for (int i = 0; i < UsersResponses.Count; i++)
            {
                Console.Write($"User {i + 1}:");
                for (int j=0; j < UsersResponses[i].Count; j++)
                {
                    Console.WriteLine("\tQuestion " + (j+1) + ": " + UsersResponses[i][j]);
                }
                Console.WriteLine();
            }

            Console.ReadKey();
        }
    }
}
