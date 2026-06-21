using System;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Linq;

namespace _67___Task_Management_System
{
    class Task : INotifyPropertyChanged
    {
        public enum enStatus
        {
            Run, Stop
        }

        public string Name { get; set; }

        private enStatus _status;
        public enStatus Status
        {
            get => _status;
            set
            {
                if (_status != value)
                {
                    _status = value;
                    OnPropertyChanged(nameof(Status));
                }
            }
        }

        public Task(string Name, enStatus Status)
        {
            this.Name = Name;
            this.Status = Status;
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged(string propName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propName));
        }
    }
    internal class Program
    {
        static void Tasks_CollectionChanged(object sender, NotifyCollectionChangedEventArgs e)
        {
            // Subscribe to new items
            if (e.NewItems != null)
            {
                foreach (Task t in e.NewItems)
                {
                    t.PropertyChanged += Task_PropertyChanged;
                }
            }

            // Unsubscribe from removed items
            if (e.OldItems != null)
            {
                foreach (Task t in e.OldItems)
                {
                    t.PropertyChanged -= Task_PropertyChanged;
                }
            }

            switch (e.Action)
            {
                case NotifyCollectionChangedAction.Add:
                    Console.WriteLine($"Added: {((Task)e.NewItems[0]).Name} - Status: {((Task)e.NewItems[0]).Status}\n");
                    break;

                case NotifyCollectionChangedAction.Remove:
                    Console.WriteLine($"Removed: {((Task)e.OldItems[0]).Name}\n");
                    break;
            }
        }

        static void Task_PropertyChanged(object sender, PropertyChangedEventArgs e)
        {
            if (e.PropertyName == "Status")
            {
                Task t = (Task)sender;
                Console.WriteLine($"Updated: {t.Name} -> {t.Status}\n");
            }
        }

        static void Main(string[] args)
        {
            ObservableCollection<Task> Tasks = new ObservableCollection<Task>();
            Tasks.CollectionChanged += Tasks_CollectionChanged;

            // Add tasks
            Tasks.Add(new Task("Chrome", Task.enStatus.Run));
            Tasks.Add(new Task("Firefox", Task.enStatus.Run));
            Tasks.Add(new Task("VSC", Task.enStatus.Run));

            // Remove by Name 
            var taskToRemove = Tasks.FirstOrDefault(t => t.Name == "VSC");
            if (taskToRemove != null)
                Tasks.Remove(taskToRemove);

            // Add again
            Tasks.Add(new Task("VSC", Task.enStatus.Run));

            // Update status 
            var taskToUpdate = Tasks.FirstOrDefault(t => t.Name == "Chrome");
            if (taskToUpdate != null)
                taskToUpdate.Status = Task.enStatus.Stop;

            Console.ReadKey();
        }
    }
}

