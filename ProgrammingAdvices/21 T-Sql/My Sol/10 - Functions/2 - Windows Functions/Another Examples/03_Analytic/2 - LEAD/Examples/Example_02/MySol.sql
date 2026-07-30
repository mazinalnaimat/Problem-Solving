USE WindowFunctionsTrainingDB;
GO


select 
      CustomerName,
      OrderDate,
      Amount,
      LEAD(Amount)
      over
      (
        partition by CustomerName
        order by OrderDate, OrderID
      )
      AS NextOrderAmount
from SalesOrders
order by CustomerName, OrderDate;


