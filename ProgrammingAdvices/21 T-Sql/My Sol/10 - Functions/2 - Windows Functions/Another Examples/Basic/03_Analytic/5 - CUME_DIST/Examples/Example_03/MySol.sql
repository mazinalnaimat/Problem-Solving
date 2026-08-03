USE WindowFunctionsTrainingDB;
GO


select 
      Region,
      OrderID,
      Amount,
      CUME_DIST()
      OVER
      (
        partition by Region
        order by Amount
      )AS AmountPerRegionCumeDist
from SalesOrders
order by  Region, Amount;



