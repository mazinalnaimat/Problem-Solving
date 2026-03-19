using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _73___Dynamic_Seating_Arrangement_in_a_Classroom
{
    internal class Program
    {
        static void Main()
        {
            int[][] classroomSeats = new int[3][];
            classroomSeats[0] = new int[] { 1, 2, 3 }; // Row 1
            classroomSeats[1] = new int[] { 4, 5 };    // Row 2
            classroomSeats[2] = new int[] { 6, 7, 8, 9 }; // Row 3


            Console.WriteLine("Classroom Seating:");
            for (int i = 0; i < classroomSeats.Length; i++)
            {
                Console.Write($"Row {i + 1}: ");
                foreach (int seat in classroomSeats[i])
                {
                    Console.Write(seat + " ");
                }
                Console.WriteLine();
            }
            Console.ReadKey();


        }
    }
}
