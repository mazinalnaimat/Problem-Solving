using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _71___Store_Marks_of_Students_in_Multiple_Subjects
{
    internal class Program
    {
        
        static void Main(string[] args)
        {
            int[][] StudentsMarks = new int[3][]; 

            
            StudentsMarks[0] = new int[] {90, 85, 88};
            StudentsMarks[1] = new int[] {76, 80};
            StudentsMarks[2] = new int[] {92, 93, 89, 85};

            for (int i = 0; i < StudentsMarks.Length; i++)
            {
                Console.Write("Student" + (i + 1) + " Marks : ");
                for (int j =0; j < StudentsMarks[i].Length; j++)
                {
                    Console.Write(StudentsMarks[i][j]+ " ");
                }
                Console.WriteLine();
            }

            Console.ReadKey();

            
        }
    }
}
