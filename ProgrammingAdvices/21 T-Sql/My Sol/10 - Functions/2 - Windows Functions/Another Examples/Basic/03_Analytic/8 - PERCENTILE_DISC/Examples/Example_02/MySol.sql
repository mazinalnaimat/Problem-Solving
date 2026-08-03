USE WindowFunctionsTrainingDB;
GO

select distinct
      region,
      PERCENTILE_DISC(0.75)
      within group(order by Amount)
      over
      (
        partition by Region
      )AS DiscreteP75Amount
from SalesOrders