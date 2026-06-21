using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _8___Ticketing_System_Simulation
{
    internal class Program
    {
        class Ticket
        {
            public int Id { set; get; }
            public Ticket(int Id)
            {
                this.Id = Id;
                Console.WriteLine("Ticket " + Id + " issued.");
            }
        }

        static void Main(string[] args)
        {
            Queue<Ticket> Tickets = new Queue<Ticket>();
            for (int i = 101; i < 106; i++)
            {
                Tickets.Enqueue(new Ticket(i));

            }


            Console.WriteLine();
            Console.WriteLine("Ticketing System Simulation Started...");

            while (Tickets.Count() > 0)
            {
                Console.WriteLine();
                Console.WriteLine("Processing Ticket: " + Tickets.Dequeue().Id);
                string RestTickets = "";

                if ((Tickets.Count() > 0))
                {
                    RestTickets = string.Join(",", Tickets.Select(Ticket => Ticket.Id));
                    Console.WriteLine("Remaining Tickets: " + RestTickets);

                }
                else 
                {

                    Console.WriteLine("No more tickets in the queue.");
                }

                Console.WriteLine();



            }


            Console.WriteLine("Ticketing System Simulation Ended.");
            Console.ReadLine();

        }
    }
}
