USE WindowFunctionsTrainingDB;
GO


select 
      Region,
      OrderID,
      Amount,

      DENSE_RANK() OVER
      (
        partition by Region
        order by amount
      )
      AS DenseAmountPerRegionRank
from SalesOrders;








