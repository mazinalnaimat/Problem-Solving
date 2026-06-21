using System;


namespace _117___Determine_if_given_Two_Trees_are_Identical_or_not
{
    public class TreeNode
    {
        public int Value { get; set; }
        public TreeNode Left { get; set; }
        public TreeNode Right { get; set; }

        public TreeNode(int Value)
        {
            this.Value = Value;
        }

        public TreeNode(TreeNode Other)
        {
            if (Other == null)
                throw new ArgumentNullException(nameof(Other));

            Value = Other.Value;
            Left = Other.Left != null ? new TreeNode(Other.Left) : null;
            Right = Other.Right != null ? new TreeNode(Other.Right) : null;
        }
    }

    public class BinaryTree
    {
        public TreeNode Root { get; set; }

        public BinaryTree(TreeNode Root)
        {
            this.Root = Root;
        }

        public BinaryTree(BinaryTree Other)
        {
            if (Other == null)
                throw new ArgumentNullException(nameof(Other));

            Root = Other.Root != null ? new TreeNode(Other.Root) : null;
        }

        private void Print(TreeNode Node, int Indent)
        {
            if (Node == null)
                return;

            Print(Node.Right, Indent + 1);
            Console.WriteLine(new string(' ', Indent * 2) + Node.Value);
            Print(Node.Left, Indent + 1);
        }

        public void Print()
        {
            Print(Root, 0);
        }

        private static bool AreTreesIdentical(TreeNode Node1, TreeNode Node2)
        {
            if (Node1 == null && Node2 == null)
                return true;

            if (Node1 == null || Node2 == null)
                return false;

            if (Node1.Value != Node2.Value)
                return false;

            return AreTreesIdentical(Node1.Left, Node2.Left) && AreTreesIdentical(Node1.Right, Node2.Right);
        }

        public bool IsIdenticalTo(BinaryTree Other)
        {
            if (Other == null)
                return false;

            return AreTreesIdentical(Root, Other.Root);
        }

    }

    class Program
    {
        static void Main(string[] args)
        {
            TreeNode Root = new TreeNode(4)
            {
                Left = new TreeNode(6)
                {
                    Right = new TreeNode(10)
                },
                Right = new TreeNode(3)
                {
                    Left = new TreeNode(7),
                    Right = new TreeNode(5)
                }
            };

            BinaryTree Tree1 = new BinaryTree(Root);
            BinaryTree Tree2 = new BinaryTree(Root); 

            Console.WriteLine("Tree 1:");
            Tree1.Print();

            Console.WriteLine("\nTree 2 (identical to Tree 1):");
            Tree2.Print();

            Console.WriteLine("\nAre Tree1 and Tree2 identical? " + Tree1.IsIdenticalTo(Tree2));

            BinaryTree Tree3 = new BinaryTree(Tree1);
            Tree3.Root.Right.Right = new TreeNode(16);

            Console.WriteLine("\nTree 3 (modified copy):");
            Tree3.Print();

            Console.WriteLine("\nAre Tree1 and Tree3 identical? " + Tree1.IsIdenticalTo(Tree3));

            Console.ReadKey();
        }
    }
}