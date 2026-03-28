using System;
using System.Collections.Generic;

class Task
{
    public string Name { get; set; } // Task name
    public int Priority { get; set; } // Task priority


    public Task(string name, int priority)
    {
        Name = name;
        Priority = priority;
    }


    public override string ToString()
    {
        return $"Task: {Name}, Priority: {Priority}";
    }
}


class MinHeap
{
    private List<Task> heap = new List<Task>();


    public void Insert(Task task)
    {
        heap.Add(task);
        HeapifyUp(heap.Count - 1);
    }


    public Task ExtractMin()
    {
        if (heap.Count == 0) return null;


        var minTask = heap[0];
        heap[0] = heap[heap.Count - 1];
        heap.RemoveAt(heap.Count - 1);
        HeapifyDown(0);


        return minTask;
    }


    private void HeapifyUp(int index)
    {
        while (index > 0 && heap[index].Priority < heap[(index - 1) / 2].Priority)
        {
            Swap(index, (index - 1) / 2);
            index = (index - 1) / 2;
        }
    }


    private void HeapifyDown(int index)
    {
        int smallest = index;
        int left = 2 * index + 1;
        int right = 2 * index + 2;


        if (left < heap.Count && heap[left].Priority < heap[smallest].Priority)
            smallest = left;


        if (right < heap.Count && heap[right].Priority < heap[smallest].Priority)
            smallest = right;


        if (smallest != index)
        {
            Swap(index, smallest);
            HeapifyDown(smallest);
        }
    }


    private void Swap(int i, int j)
    {
        var temp = heap[i];
        heap[i] = heap[j];
        heap[j] = temp;
    }

    public bool IsEmpty()
    {
        return heap.Count == 0;
    }
}


class Program
{
    static void Main(string[] args)
    {
        var scheduler = new MinHeap();

        // Add tasks with priorities
        scheduler.Insert(new Task("Task A", 3));
        scheduler.Insert(new Task("Task B", 1));
        scheduler.Insert(new Task("Task C", 2));
        Console.WriteLine("Tasks entered in this order: Task A, Task B, Task C.\n");

        // Process tasks in priority order
        Console.WriteLine("Executing tasks in priority order:");
        while (!scheduler.IsEmpty())
        {
            Console.WriteLine(scheduler.ExtractMin());
        }

        // Pause the screen
        Console.ReadKey();
    }
}

