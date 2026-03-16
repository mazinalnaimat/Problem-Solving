using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _63___Real_Time_Leaderboard
{
    public class Player : IComparable<Player>
    {
        public int Score { get; set; }
        public string Name { get; set; }

        public Player(string Name, int Score)
        {
            this.Name = Name;
            this.Score = Score;
        }

        public int CompareTo(Player other)
        {
            return other.Score.CompareTo(this.Score); 
        }
    }
    internal class Program
    {

        static void Main(string[] args)
        {
            SortedSet<Player> Players = new SortedSet<Player>();
            Players.Add(new Player("Ali", 20));
            Players.Add(new Player("Ahemd", 25));
            Players.Add(new Player("Hamed", 30));
            Players.Add(new Player("Ibrahim", 18));
            Players.Add(new Player("Emran", 12));
            Players.Add(new Player("Omar", 21));
            Players.Add(new Player("Rami", 22));
            Players.Add(new Player("Mohammad", 25));
            Players.Add(new Player("Yosuof", 32));
            Players.Add(new Player("Salim", 35));
            Players.Add(new Player("Mahmoud", 45));
            Players.Add(new Player("Sahim", 30));
            Console.WriteLine("Players:");
            int Counter = 1;
            foreach (Player Player in Players)
            {
                Console.WriteLine("\t{0,2}: {1,-10} Score: {2}", Counter, Player.Name, Player.Score);
                Counter++;
            }
            Console.ReadKey();
        }
    }
}
