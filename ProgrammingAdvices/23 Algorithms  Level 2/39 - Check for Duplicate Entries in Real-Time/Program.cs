using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _39___Check_for_Duplicate_Entries_in_Real_Time
{
    internal class Program
    {
        static void Main(string[] args)
        {
            HashSet<string> Set = new HashSet<string>();

            bool CloseLoop = false;

            while (!CloseLoop)
            {
                Console.Write("Enter Your Input: ");
                string Input = Console.ReadLine();
                if (Set.Add(Input) == false)
                {
                    Console.WriteLine("Your Input Is already Added To Set Enter Another Value.");
                }
             


                while (true)
                {
                    Console.Write("Do you Want To Enter More Y/N? ");
                    string CharCheck = Console.ReadLine();
                    if (CharCheck.ToUpper() == "Y")
                    {
                        break;
                    }
                    else if (CharCheck.ToUpper() == "N")
                    {
                        CloseLoop = true;
                        break;
                    }
                    else 
                    {
                        Console.WriteLine("Enter Y or N.");
                    }
                }
            
            }

        }
    }
}
