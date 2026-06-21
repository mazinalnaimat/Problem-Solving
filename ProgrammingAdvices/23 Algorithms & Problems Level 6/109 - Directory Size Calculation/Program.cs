using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DirectorySizeCalculation
{
    public class File
    {
        public string Name { get; }
        public int Size { get; }

        public File(string name, int size)
        {
            if (string.IsNullOrWhiteSpace(name))
                throw new ArgumentException("File name cannot be null or empty.", nameof(name));
            if (size < 0)
                throw new ArgumentOutOfRangeException(nameof(size), "Size cannot be negative.");

            Name = name;
            Size = size;
        }
    }

    public class Directory
    {
        public string Name { get; }

        private readonly List<File> _files = new List<File>();
        private readonly List<Directory> _subDirectories = new List<Directory>();

        public IReadOnlyList<File> Files => _files.AsReadOnly();
        public IReadOnlyList<Directory> SubDirectories => _subDirectories.AsReadOnly();

        public Directory(string name)
        {
            if (string.IsNullOrWhiteSpace(name))
                throw new ArgumentException("Directory name cannot be null or empty.", nameof(name));

            Name = name;
        }

        public void AddFile(File file)
        {
            if (file == null)
                throw new ArgumentNullException(nameof(file));
            _files.Add(file);
        }

        public void AddSubDirectory(Directory subDirectory)
        {
            if (subDirectory == null)
                throw new ArgumentNullException(nameof(subDirectory));
            _subDirectories.Add(subDirectory);
        }
        private int CalculateSize()
        {
            int total = 0;

            foreach (var file in _files)
            {
                total += file.Size;
            }

            foreach (var subDir in _subDirectories)
            {
                total += subDir.CalculateSize();
            }

            return total;
        }
        public int GetTotalSize()
        {
            return CalculateSize();
        }


    }

    internal class Program
    {
        static void Main(string[] args)
        {
            var desktop = new Directory("Desktop");

            desktop.AddFile(new File("1.jpg", 10));
            desktop.AddFile(new File("2.jpg", 45));
            desktop.AddFile(new File("look.dll", 50));

            var myFiles = new Directory("MyFiles");
            desktop.AddSubDirectory(myFiles);

            myFiles.AddFile(new File("Game_C++.exe", 12));
            myFiles.AddFile(new File("Note1.pdf", 21));

            Console.WriteLine($"Desktop Size: {desktop.GetTotalSize()}");
            Console.WriteLine($"MyFiles Size: {myFiles.GetTotalSize()}");

            Console.ReadKey();
        }
    }
}