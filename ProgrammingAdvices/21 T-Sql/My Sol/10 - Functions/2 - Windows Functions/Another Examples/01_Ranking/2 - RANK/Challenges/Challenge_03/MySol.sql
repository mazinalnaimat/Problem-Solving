USE WindowFunctionsTrainingDB;
GO
select     
      Region,
      OrderID,
      CustomerName,
      Amount,
      RANK() OVER
      (
        partition by Region
        order By amount desc
      )
      as AmountRankPerRegion

from SalesOrders 









