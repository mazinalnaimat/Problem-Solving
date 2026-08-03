USE WindowFunctionsTrainingDB;
GO

select
      Region,
      OrderID,
      Amount,
      PERCENT_RANK()
      OVER
      (
        partition by Region
        order by Amount
      )
      AS AmountPerRegionPercentRank
from SalesOrders
order by Region, Amount;

