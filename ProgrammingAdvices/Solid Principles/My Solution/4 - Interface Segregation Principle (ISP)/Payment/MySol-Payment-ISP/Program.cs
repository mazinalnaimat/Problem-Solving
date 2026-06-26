using System;

public interface IPayment
{
    void Pay();
}
public interface ICreditCard: IPayment
{
}
public interface IPayPal: IPayment
{

}
public interface IBitcoin: IPayment
{

}


public class CreditCardPayment : ICreditCard
{
    public void Pay()
    {
        Console.WriteLine("Payment with credit card.");
    }

}

public class PayPalPayment : IPayPal
{

    public void Pay()
    {
        Console.WriteLine("Payment with PayPal.");
    }

}
public class BitcoinPayment : IBitcoin
{

    public void Pay()
    {
        Console.WriteLine("Payment with Bitcoin.");
    }

}

public class Program
{
    public static void Main()
    {
        IPayment creditCardPayment = new CreditCardPayment();
        creditCardPayment.Pay();


        IPayment payPalPayment = new PayPalPayment();
        payPalPayment.Pay();

        Console.ReadKey();

    }
}
