

using System;

public class PaymentService
{
    private IPayment _payment;

    public PaymentService(IPayment payment)
    {
        _payment = payment;
    }

    public void Pay(decimal Price)
    {
        _payment.Pay(Price);
    }
}


public interface IPayment
{
    void Pay(decimal Price);
}

public class PayPalPaymentService : IPayment
{
    public void Pay(decimal Price)
    {
        Console.WriteLine($"Pay ${Price} with PayPal\n");
    }
}
public class CreditCardPaymentService : IPayment
{
    public void Pay(decimal Price)
    {
        Console.WriteLine($"Pay ${Price} with Credit Card\n");
    }
}
public class BankTransferPaymentService: IPayment
{
    public void Pay(decimal Price)
    {
        Console.WriteLine($"Pay ${Price} with Bank Transfer\n");
    }
}
public class BitcoinPaymentService : IPayment
{
    public void Pay(decimal Price)
    {
        Console.WriteLine($"Pay ${Price} with Bitcoin\n");
    }
}

public class Program
{
    static void Main(string[] args)
    {
        PaymentService paymentService = new PaymentService(new PayPalPaymentService());
        paymentService.Pay(500);

        paymentService = new PaymentService(new CreditCardPaymentService());
        paymentService.Pay(500);

        paymentService = new PaymentService(new BankTransferPaymentService());
        paymentService.Pay(500); 

        paymentService = new PaymentService(new BitcoinPaymentService());
        paymentService.Pay(500);

        Console.ReadKey();
    }
}
