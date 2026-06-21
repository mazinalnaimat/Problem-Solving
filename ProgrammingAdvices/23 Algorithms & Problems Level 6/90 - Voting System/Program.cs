using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _90___Voting_System
{
    internal class Program
    {
        static void Main(string[] args)
        {
            BitArray Votes = new BitArray(8);

            Votes[0] = false;
            Votes[1] = true;
            Votes[2] = false;
            Votes[3] = true;
            Votes[4] = true;
            Votes[5] = true;
            Votes[6] = false;
            Votes[7] = false;

            int YesVotesCount = 0;

            for (int i = 0; i < 8; i++)
            {
                if (Votes[i] == true)
                {
                    YesVotesCount++;
                }
                Console.WriteLine("Vote " + (i + 1) + ": " + Votes[i]);
            }

            Console.WriteLine("\nOver all yse votes number: " + YesVotesCount);

            Console.ReadKey();

        }
    }
}
