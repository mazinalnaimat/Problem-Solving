using System;
using System.Runtime.CompilerServices;
using System.Transactions;

public class LoggingService
{
    private ILogging _logging;
    public LoggingService(ILogging loggingService)
    {
        _logging = loggingService;
    }
    public void Log(string Msg)
    {
        _logging.Log(Msg);
    }

}

public interface ILogging
{
    public void Log(string Msg);
}

public class FileLoggingService : ILogging
{
    // Method to log to file
    public  void Log(string Msg)
    {
        Console.WriteLine($"\nLog to file: {Msg}");
    }
}

public class EventLogService : ILogging
{
    // Method to log to EventLog
    public void Log(string Msg)
    {
        Console.WriteLine($"\nLog to Event Log: {Msg}");
    }
}

public class DatabaseLoggingService : ILogging
{

    // Method to log to file
    public  void Log(string Msg)
    {
        Console.WriteLine($"\nLog to Database: {Msg}");
    }
}


class Program
{
    static void Main()
    {
        LoggingService FileLoggingService = new LoggingService(new FileLoggingService());
        // Log to File
        FileLoggingService.Log("Error Occured line xxx.");


        LoggingService EventLogService = new LoggingService(new EventLogService());
        // Log to Event Log
        EventLogService.Log("Error Occured line xxx.");

        LoggingService DatabaseLoggingService = new LoggingService(new DatabaseLoggingService());
        // Log to Database
        DatabaseLoggingService.Log("Error Occured line xxx.");




        Console.ReadKey();

    }
}
