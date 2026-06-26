using System;

public interface IEmailDevice
{
    void SendEmail();

}
public interface ICallDevice
{
    void MakeCall();

}
public interface IGPSDevice
{
    void UseGPS();

}
public interface IPhotoDevice
{
    void TakePhoto();

}



public class Smartphone : IEmailDevice, ICallDevice, IGPSDevice, IPhotoDevice
{
    public void MakeCall()
    {
        Console.WriteLine("Making a call.");
    }

    public void TakePhoto()
    {
        Console.WriteLine("Taking Photo.");
    }

    public void SendEmail()
    {
        Console.WriteLine("Sending an email.");
    }

    public void UseGPS()
    {
        Console.WriteLine("Using GPS.");
    }
}

public class Computer : IEmailDevice
{


    public void SendEmail()
    {
        Console.WriteLine("Sending an email.");
    }

}

public class Program
{
    public static void Main()
    {
        Smartphone smartphone = new Smartphone();
        Console.WriteLine("SmartPhone:");
        smartphone.MakeCall();
        smartphone.TakePhoto();
        smartphone.SendEmail();
        smartphone.UseGPS();

        Computer computer = new Computer();
        Console.WriteLine("\nComputer:");
        computer.SendEmail();
        //computer.TakePhoto();// This will throw an exception.
        //computer.SendEmail();// This will throw an exception.
        //computer.UseGPS();// This will throw an exception.
        

        Console.ReadKey();

        
    }
}
