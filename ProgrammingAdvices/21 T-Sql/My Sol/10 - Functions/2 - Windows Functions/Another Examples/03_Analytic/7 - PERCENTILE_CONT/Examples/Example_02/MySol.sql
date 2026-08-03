USE WindowFunctionsTrainingDB;
GO

select distinct
      region,
      PERCENTILE_CONT(0.75)
      within group(order by Amount)
      over
      (
        partition by Region
      )AS P75Amount
from SalesOrders