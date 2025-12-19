using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace _15___Generate_Binary_Numbers_Using_For_Loops
{
    internal class Program
    {
        public static List<StringBuilder> GenerateBinNum(int MaxNumber)
        {
            List<StringBuilder> BinNumList = new List<StringBuilder>();
            if (MaxNumber > 0)
            {
                StringBuilder Number = new StringBuilder("0");
                bool AddNum = false;
                for (int i = 1; i <= MaxNumber; i++)
                {
                    AddNum = false;
                    for (int j = Number.Length - 1; j >= 0; j--)
                    {
                        if (Number[j] == '0')
                        {
                            AddNum = true;
                            Number[j] = '1';

                            for (int k = j + 1; k < Number.Length; k++)
                            {
                                Number[k] = '0';
                            }

                            break;
                        }
                    }
                    if (AddNum)
                        BinNumList.Add(new StringBuilder(Number.ToString()));
                    else
                    {
                        for (int z = 1; z < Number.Length; z++)
                        {
                            Number[z] = '0';
                        }
                        Number.Append("0");
                        BinNumList.Add(new StringBuilder(Number.ToString()));

                    }

                }


            }

            return BinNumList;

        }
        static void Main(string[] args)
        {
            List<StringBuilder> BinNumsTo5 = GenerateBinNum(10);

            Console.WriteLine(string.Join(", ", BinNumsTo5));

            Console.ReadLine();
        }
    }
}

