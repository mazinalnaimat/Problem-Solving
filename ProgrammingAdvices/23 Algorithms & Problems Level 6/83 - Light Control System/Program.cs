using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _83___Light_Control_System
{
    internal class Program
    {
        static void Main(string[] args)
        {
            BitArray HomeLights = new BitArray(8);

            HomeLights[0] = true;
            for (int i=0; i<HomeLights.Length; i++)
            {
                Console.WriteLine("Light" + (i+1) + ": " + (HomeLights[i] ? "On": "Off"));
            }
            Console.WriteLine();

            HomeLights = new BitArray(new int[] { 0b01010101 });
            HomeLights.Length = 8;
            for (int i = 0; i < HomeLights.Length; i++)
            {
                Console.WriteLine("Light" + (i + 1) + ": " + (HomeLights[i] ? "On" : "Off"));
            }
            Console.WriteLine();

            HomeLights = new BitArray(new int[] { 0b11110101 });
            HomeLights.Length = 8;

            for (int i = 0; i < HomeLights.Length; i++)
            {
                Console.WriteLine("Light" + (i + 1) + ": " + (HomeLights[i] ? "On" : "Off"));
            }
            Console.WriteLine();


            Console.ReadKey();
        }
    }
}
