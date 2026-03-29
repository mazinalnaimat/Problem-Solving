using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _115___Category_Hierarchy
{

    public class Product
    {
        public string Name { get; set; }
        public List<Product> SubProducts = new List<Product>();

        public Product(string Name)
        {
            this.Name = Name;
        }

        private void PrintAllHierarchy(Product P, string Space)
        {
            Console.WriteLine(Space + P.Name);
            Space += "\t";

            foreach (var SubProduct in P.SubProducts)
            {
                PrintAllHierarchy(SubProduct, Space);
            }
            if (P.SubProducts.Count() > 0)
            {
                Console.WriteLine();
            }
        }
        public void PrintAllHierarchy()
        {
            PrintAllHierarchy(this, "");
        }
    
    
    }




    internal class Program
    {
        static void Main(string[] args)
        {
            Product Elec = new Product("Electronics");

            Product Mobiles = new Product("Mobiles");
            {
                Elec.SubProducts.Add(Mobiles);
                Product P1 = new Product("Samsung");
                Product P2 = new Product("Apple");
                Mobiles.SubProducts.Add(P1);
                Mobiles.SubProducts.Add(P2);
            }


            Product Laptops = new Product("Laptops");
            {
                Elec.SubProducts.Add(Laptops);
                Product P1 = new Product("Lenovo");
                Product P2 = new Product("HP");
                Laptops.SubProducts.Add(P1);
                Laptops.SubProducts.Add(P2);
            }

            Console.WriteLine("Category Hierarchy:\n");

            Elec.PrintAllHierarchy();

            Console.ReadKey();
        }
    }
}
