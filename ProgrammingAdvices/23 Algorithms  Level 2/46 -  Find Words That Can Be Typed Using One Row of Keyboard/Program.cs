using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _46____Find_Words_That_Can_Be_Typed_Using_One_Row_of_Keyboard
{
    internal class Program
    {
        //1st Solution
        /*
        public static List<string> FindWordsUsingOneRow(in List<string> AllWords)
        {
            List<string> WordsByOneRow = new List<string>();
            HashSet<char> FirstRow = new HashSet<char>
            {
                'q','w','e','r','t','y','u','i','o','p'
            };
            HashSet<char> SecondRow = new HashSet<char> 
            { 
                'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l' 
            };

            HashSet<char> ThirdRow = new HashSet<char> 
            { 
                'z', 'x', 'c', 'v', 'b', 'n', 'm'
            };

         
            foreach (string Word in AllWords)
            {
                byte PreviousRow = 0;
                byte CurrentRow = 0;
                bool AddWord = true;
                foreach (char Letter in Word)
                {
                    PreviousRow = CurrentRow;
                    if (FirstRow.Contains(char.ToLower(Letter)))
                    {
                        CurrentRow = 1;
                    }

                    else if (SecondRow.Contains(char.ToLower(Letter)))
                    {
                        CurrentRow = 2;
                    }
                    else if (ThirdRow.Contains(char.ToLower(Letter)))
                    {
                        CurrentRow = 3;
                    }
                    else
                    {
                        break;
                    }

                    if (PreviousRow != CurrentRow && PreviousRow != 0)
                    {
                        AddWord = false;
                        break;
                    }
                }

                if (AddWord == true)
                {
                    WordsByOneRow.Add(Word);
                }
            }

            return WordsByOneRow;
        }
        */

        //2nd Solution
        public static List<string> FindWordsUsingOneRow(in List<string> AllWords)
        {
            List<string> WordsByOneRow = new List<string>();
            HashSet<char> FirstRow = new HashSet<char>
            {
                'q','w','e','r','t','y','u','i','o','p'
            };
            HashSet<char> SecondRow = new HashSet<char>
            {
                'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l'
            };

            HashSet<char> ThirdRow = new HashSet<char>
            {
                'z', 'x', 'c', 'v', 'b', 'n', 'm'
            };



            foreach (string Word in AllWords)
            {
                Dictionary<char, int> LetterRowInWord = new Dictionary<char, int>();
                foreach (char Letter in Word)
                {
                    if (FirstRow.Contains(char.ToLower(Letter)))
                    {
                        LetterRowInWord[Letter] = 1;
                    }

                    else if (SecondRow.Contains(char.ToLower(Letter)))
                    {
                        LetterRowInWord[Letter] = 2;
                    }
                    else if (ThirdRow.Contains(char.ToLower(Letter)))
                    {
                        LetterRowInWord[Letter] = 3;
                    }
                    else
                    {
                        LetterRowInWord[Letter] = -1;

                        break;
                    }

                 
                }

                if (LetterRowInWord.Values.All(v => v.Equals(LetterRowInWord.Values.First())))
                {
                    WordsByOneRow.Add(Word);
                }
            }

            return WordsByOneRow;
        }

        static void Main(string[] args)
        {
            List<string> AllWords = new List<string>
            { "Hello", "Alaska", "Dad", "Peace"};

            Console.WriteLine("The input: " + string.Join(", " , AllWords));

            List<string> WordsByOneRow = FindWordsUsingOneRow(AllWords);
            Console.WriteLine("The Words By One Row: " + string.Join(", " , WordsByOneRow));

            Console.ReadLine();

        }
    }
}
