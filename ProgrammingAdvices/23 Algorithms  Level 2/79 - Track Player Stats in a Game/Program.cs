using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _79___Track_Player_Stats_in_a_Game
{
    internal class Program
    {

        static void Main(string[] args)
        {
            var Player1 = (Name: "Mohammad", Health: 53,  Score: 12);
            Console.WriteLine("Player1: " + Player1.Name + ", Health: " + Player1.Health + ", Score: " + Player1.Score);

            Console.ReadKey();
        }
    }
}
