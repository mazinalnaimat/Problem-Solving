using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _37___Phonebook_Application
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Dictionary<string, string> PhoneBook = new Dictionary<string, string>();
            PhoneBook.Add("Alice", "123-342-8923");
            PhoneBook.Add("Liam", "543-453-4990");
            PhoneBook.Add("Bob", "984-233-8342");
            PhoneBook.Add("John", "546-453-8723");
            PhoneBook.Add("Noah", "334-900-8087");

            foreach (var Phone in PhoneBook)
            {
                Console.WriteLine(Phone.Key + "'s Phone: " + Phone.Value);
            }

            Console.ReadLine();

        }
    }
}
