using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _77___City_Temperature_Data
{
    internal class Program
    {
        static void Main()
        {
            double[][] cityTemperatures = new double[2][];
            cityTemperatures[0] = new double[] { 29.5, 30.0, 28.7 }; 
            cityTemperatures[1] = new double[] { 25.0, 26.5 };       


            Console.WriteLine("Temperature Data:");
            for (int i = 0; i < cityTemperatures.Length; i++)
            {
                Console.Write($"City {i + 1}: ");
                foreach (double temp in cityTemperatures[i])
                {
                    Console.Write(temp + "°C ");
                }
                Console.WriteLine();
            }
            Console.ReadKey();
        }
    }
}
