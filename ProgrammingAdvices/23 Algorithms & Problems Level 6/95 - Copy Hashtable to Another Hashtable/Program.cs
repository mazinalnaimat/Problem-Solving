using System;
using System.Collections;

namespace _95___Copy_Hashtable_to_Another_Hashtable
{
    internal class Program
    {
        static string CenterText(string Text, int Width)
        {
            if (Text.Length >= Width)
                return Text;

            int LeftPadding = (Width - Text.Length) / 2;
            int RightPadding = Width - Text.Length - LeftPadding;

            return new string(' ', LeftPadding) + Text + new string(' ', RightPadding);
        }

        static void Main(string[] args)
        {
            // Original hashtable
            Hashtable StudentsMarks1 = new Hashtable
            {
                { "Salim", 55 },
                { "Ahmed", 64 },
                { "Tareq", 89 },
                { "Sulieman", 75 }
            };

            // Copy to another hashtable
            Hashtable StudentsMarks2 = new Hashtable(StudentsMarks1)
            {
                { "Adem", 88 },
                { "Ibrahim", 93 }
            };

            // Column widths
            int NumWidth = 10;
            int NameWidth = 20;
            int MarkWidth = 10;

            // Display StudentsMarks1
            int Counter = 0;
            Console.WriteLine("Students Marks1:");
            Console.WriteLine(
                CenterText("No", NumWidth) +
                CenterText("Name", NameWidth) +
                CenterText("Mark", MarkWidth)
            );

            foreach (DictionaryEntry StudentMark in StudentsMarks1)
            {
                string Name = (string)StudentMark.Key;
                int Mark = (int)StudentMark.Value;
                Counter++;

                Console.WriteLine(
                    CenterText(Counter.ToString(), NumWidth) +
                    CenterText(Name, NameWidth) +
                    CenterText(Mark.ToString(), MarkWidth)
                );
            }

            Console.WriteLine();

            // Display StudentsMarks2
            Counter = 0;
            Console.WriteLine("Students Marks2:");
            Console.WriteLine(
                CenterText("No", NumWidth) +
                CenterText("Name", NameWidth) +
                CenterText("Mark", MarkWidth)
            );

            foreach (DictionaryEntry StudentMark in StudentsMarks2)
            {
                string Name = (string)StudentMark.Key;
                int Mark = (int)StudentMark.Value;
                Counter++;

                Console.WriteLine(
                    CenterText(Counter.ToString(), NumWidth) +
                    CenterText(Name, NameWidth) +
                    CenterText(Mark.ToString(), MarkWidth)
                );
            }

            Console.ReadKey();
        }
    }
}