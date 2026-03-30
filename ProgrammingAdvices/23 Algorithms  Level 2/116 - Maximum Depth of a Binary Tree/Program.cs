using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _116___Maximum_Depth_of_a_Binary_Tree
{
    
    public class TreeNode
    {
        public int Value;
        public TreeNode Right;
        public TreeNode Left;

        public TreeNode(int Value)
        {
            this.Value = Value;
        }


    }
    
    public class BinaryTree
    {
        private TreeNode _Root;
        public BinaryTree(TreeNode Root)
        {
            this._Root = Root;
        }
        private int GetDepth(TreeNode Node)
        {
            if (Node == null)
                return 0;

            int LeftNodeDepth = GetDepth(Node.Left);
            int RightNodeDepth = GetDepth(Node.Right);

            return 1 + Math.Max(LeftNodeDepth, RightNodeDepth);
        }
        public int GetDepth()
        {
            return GetDepth(_Root);
        }
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            TreeNode Root = new TreeNode(5);

             Root.Left = new TreeNode(4);
             Root.Left.Right = new TreeNode(15);

            Root.Right = new TreeNode(3);
            Root.Right.Left = new TreeNode(9);
            Root.Right.Right = new TreeNode(8);

            Root.Right.Left.Right = new TreeNode(10);
            Root.Right.Left.Right.Right = new TreeNode(12);
            Root.Right.Left.Right.Right.Left = new TreeNode(18);
            Root.Right.Left.Right.Right.Left.Right = new TreeNode(20);
            Root.Right.Left.Right.Right.Left.Right.Right = new TreeNode(20);

            BinaryTree BTree = new BinaryTree(Root);

            Console.WriteLine("The Depth of this Binary Tree is: " + BTree.GetDepth());

            Console.ReadKey();
        }
    }
}
