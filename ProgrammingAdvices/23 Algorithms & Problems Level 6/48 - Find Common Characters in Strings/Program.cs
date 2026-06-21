using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _48___Find_Common_Characters_in_Strings
{
    internal class Program
    {

        static List<char> GetCommonCharsInStrings(string [] Strings)
        {
            List<char> CommonChars = new List<char>();
            Dictionary<char, int> CharsFreqs = new Dictionary<char, int>();

            foreach (char Letter in Strings[0])
            {
                if (CharsFreqs.Keys.Contains(Letter))
                {
                    CharsFreqs[Letter]++;
                }
                else
                {
                    CharsFreqs.Add(Letter, 1);

                }

            }
            foreach (char Letter in CharsFreqs.Keys)
            {
                bool AddCommonChar = true;
                int MinCharFreq = CharsFreqs[Letter];
                for (int j = 1; j < Strings.Length; j++)
                {
                    if (!(Strings[j].Count(c=>c ==Letter)>0))
                    {
                        AddCommonChar = false;
                        break;
                    }

                    if (CharsFreqs[Letter] > 1)
                    {
                        if(MinCharFreq > Strings[j].Count(c => c == Letter))
                         MinCharFreq = Strings[j].Count(c => c == Letter);
                    }
                }
                if (AddCommonChar)
                {
                    for (int i = 0; i < MinCharFreq; i++)
                    {
                        CommonChars.Add(Letter);
                    }
                }
            }

            return CommonChars;
        }
        static void Main(string[] args)
        {
            string []Strings = new string [3];
            Strings[0] = "bella";
            Strings[1] = "label";
            Strings[2] = "roller";

            Console.WriteLine("The input is: "  + string.Join(", " , Strings));

            Console.WriteLine( "The Common Chars: "+ string.Join(", " , GetCommonCharsInStrings(Strings)));
            Console.ReadLine();

        }
    }
}
