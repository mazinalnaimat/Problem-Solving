using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _1___Coin_Change_Problem
{
    internal class Program
    {
        static List <int>  ReturnChangeVlaues(int ChangeValue)
        {
            List<int> ChangeList = new List<int> { 1,5,10, 20, 50, 100};
            List<int> ReturnChangeList = new List<int> { };

            byte ConuterForChangeList = 5;

            while (ChangeValue > 0)
            { 
                if((ChangeValue >= ChangeList[ConuterForChangeList]))
                {
                    ReturnChangeList.Add(ChangeList[ConuterForChangeList]);
                    ChangeValue -= ChangeList[ConuterForChangeList];

                }
                else 
                {
                    ConuterForChangeList--;
          
                }                  
                
            }

            return (ReturnChangeList);
        }

        static void Main(string[] args)
        {
            int ChangeValue = 0;
            Console.WriteLine("Enter the change value: ");
            ChangeValue = Convert.ToInt32( Console.ReadLine());
            List<int> ReturnChangeList = ReturnChangeVlaues(ChangeValue);
            Console.WriteLine("_____________________________________________");
            Console.WriteLine("Number of Changes: " + ReturnChangeList.Count());
            Console.Write("List of Changes:  ");
            ReturnChangeList.ForEach(Change => Console.Write(Change + " ,"));
            Console.ReadLine();
        }
    }
}
