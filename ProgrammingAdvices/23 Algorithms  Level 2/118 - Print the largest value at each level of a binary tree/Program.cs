using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _118___Print_the_largest_value_at_each_level_of_a_binary_tree
{

    class TreeNode
    {
        public int Value;

        public TreeNode Left;
        public  TreeNode Right;

        public TreeNode(int Value)
        {
            this.Value = Value;
        }
    }

    class BinaryTree
    {
        public TreeNode Root;

        public BinaryTree(TreeNode Root)
        {
            this.Root = Root;
        }

        private void Print(TreeNode Node, string Indent = "")
        {
            if (Node == null)
            {
                return;
            }

            Print(Node.Right, Indent+ "  ");
            Console.WriteLine(Indent + $"{Node.Value, 2}");
            Print(Node.Left, Indent + "  ");

 
        }
        public void Print()
        {
            Print(this.Root);
            Console.WriteLine();
        }
        public List<int> GetLargestValuesPerLevel()
        {
            List<int> LargestValues = new List<int>();
            if (Root == null)
                return LargestValues;

            Queue<TreeNode> Queue = new Queue<TreeNode>();
            Queue.Enqueue(Root);

            while (Queue.Count > 0)
            {
                int LevelSize = Queue.Count;
                int Max = int.MinValue;

                for (int i = 0; i < LevelSize; i++)
                {
                    TreeNode Node = Queue.Dequeue();

                    if (Node.Value > Max)
                        Max = Node.Value;

                    if (Node.Left != null)
                        Queue.Enqueue(Node.Left);

                    if (Node.Right != null)
                        Queue.Enqueue(Node.Right);
                }

                LargestValues.Add(Max);
            }

            return LargestValues;
        }

    }
    internal class Program
    {
        
        static void Main(string[] args)
        {
            TreeNode Root = new TreeNode(10);
            Root.Left = new TreeNode(15);
            Root.Left.Left = new TreeNode(9);
            Root.Left.Right = new TreeNode(8);
            Root.Right = new TreeNode(4);
            Root.Right.Left = new TreeNode(3);
            Root.Right.Right = new TreeNode(7);

            BinaryTree Tree1 = new BinaryTree(Root);

            Console.WriteLine("Tree 1: \n");
            Tree1.Print();


            List<int> LargetValues = Tree1.GetLargestValuesPerLevel();
            Console.WriteLine("Largest Value Per Level");

            for (int i = 0; i < LargetValues.Count; i++)
            {
                Console.WriteLine("Level " +(i+1) + ": " + LargetValues[i]);
            }


            Console.ReadKey();
        }
    }
}
