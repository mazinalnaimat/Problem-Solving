USE WindowFunctionsTrainingDB;
go

select 
      OrderID,
      CustomerName,
      Amount,
      NTILE(5) OVER
      (
        order by  amount desc
      )
      AS AmountGroup


from SalesOrders;