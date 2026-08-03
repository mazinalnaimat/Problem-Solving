USE WindowFunctionsTrainingDB;
GO


select 
      OrderID,
      CustomerName,
      Amount,
      NTILE(4) OVER
      (
        order by amount desc
      )
      AS AmountBucket

from SalesOrders
ORDER BY AmountBucket, Amount DESC;
