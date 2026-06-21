using System;
using System.Collections.Generic;
using System.Linq;

namespace _114___File_Permission_System
{
    enum enPermissions
    {
        Read,
        Write,
        Execute
    }

    interface IFileSystem
    {
        string Name { get; set; }
        List<enPermissions> Permissions { get; }
        bool AddPermission(enPermissions permission);
        void ShowPermissions(IFileSystem Parent = null, string Indent = "");
    }

    abstract class FileSystemNode : IFileSystem
    {
        public string Name { get; set; }
        private List<enPermissions> _Permissions = new List<enPermissions>();

        public List<enPermissions> Permissions => _Permissions;

        public virtual bool AddPermission(enPermissions Permission)
        {
            if (!_Permissions.Contains(Permission))
            {
                _Permissions.Add(Permission);
                return true;
            }
            return false;
        }

        protected List<enPermissions> GetEffectivePermissions(IFileSystem Parent)
        {
            return Permissions.Any() ? Permissions : (Parent?.Permissions ?? new List<enPermissions>());
        }

        protected static string FormatPermissions(List<enPermissions> Perms)
        {
            bool HasRead = Perms.Contains(enPermissions.Read);
            bool HasWrite = Perms.Contains(enPermissions.Write);
            bool HasExecute = Perms.Contains(enPermissions.Execute);
            return $"{(HasRead ? "r" : "-")}{(HasWrite ? "w" : "-")}{(HasExecute ? "x" : "-")}";
        }

        public abstract void ShowPermissions(IFileSystem Parent = null, string Indent = "");
    }

    class File : FileSystemNode
    {
        public override void ShowPermissions(IFileSystem Parent = null, string Indent = "")
        {
            var EffectivePerms = GetEffectivePermissions(Parent);
            string PermString = FormatPermissions(EffectivePerms);
            Console.WriteLine($"{Indent}-{PermString} {Name}");
        }
    }

    class Directory : FileSystemNode
    {
        private List<IFileSystem> _Contents = new List<IFileSystem>();
        public IReadOnlyList<IFileSystem> Contents => _Contents.AsReadOnly();

        public void AddItem(IFileSystem Item) => _Contents.Add(Item);
        public bool RemoveItem(IFileSystem Item) => _Contents.Remove(Item);
        public bool RemoveItem(string Name)
        {
            var Item = _Contents.Find(i => i.Name == Name);
            return Item != null && _Contents.Remove(Item);
        }

        public override void ShowPermissions(IFileSystem Parent = null, string Indent = "")
        {
            var EffectivePerms = GetEffectivePermissions(Parent);
            string PermString = FormatPermissions(EffectivePerms);

            //d for directory
            Console.WriteLine($"{Indent}d{PermString} {Name}");

            foreach (var Child in _Contents)
            {
                Child.ShowPermissions(this, Indent + "  ");
            }
        }
    }

    internal class Program
    {
        static void Main(string[] args)
        {
            Directory Root = new Directory { Name = "Root" };
            Root.AddPermission(enPermissions.Read);

            File File1 = new File { Name = "document.txt" };
            File File2 = new File { Name = "image.png" };

            Directory SubDir = new Directory { Name = "SubFolder" };

            Root.AddItem(File1);
            Root.AddItem(File2);
            Root.AddItem(SubDir);

            File File3 = new File { Name = "readme.md" };
            SubDir.AddItem(File3);

            File1.AddPermission(enPermissions.Read);
            SubDir.AddPermission(enPermissions.Write);

            Root.ShowPermissions();

            Console.ReadKey();
        }
    }
}