using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _7___Traffic_Signal_System_Simulation
{
    internal class Program
    {

        static void PerformTrafficSimulation(ref Queue<string>  Vehicles)
        {
            if (Vehicles.Count > 0)
            {
                Console.WriteLine();
                Console.WriteLine(Vehicles.Dequeue() + " has passed the signal");

                if (Vehicles.Count > 0)
                {
                    Console.Write("Vehicles waiting: ");

                    Console.WriteLine("Vehicles waiting: " + string.Join(", ", Vehicles));
                }
                else
                {
                    Console.WriteLine("No vehicles waiting.");

                }

            }
        
            Console.WriteLine();
        }

        static void Main(string[] args)
        {
            Queue<string> Vehicles = new Queue<string>();
            Vehicles.Enqueue("Car 1");
            Vehicles.Enqueue("Truck 1");
            Vehicles.Enqueue("Bike 1");
            Vehicles.Enqueue("Bus 1");

            Console.WriteLine("Traffic Signal Simulation Started...");
            
            while(Vehicles.Count>0)
            {
                PerformTrafficSimulation(ref Vehicles);
            }

            Console.WriteLine("Traffic Signal Simulation Ended.");



        }
    }
}
