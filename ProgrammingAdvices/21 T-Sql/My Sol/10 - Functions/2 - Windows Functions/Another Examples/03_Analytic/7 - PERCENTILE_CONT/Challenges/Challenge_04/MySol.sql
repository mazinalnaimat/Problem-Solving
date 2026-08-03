USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      SnapshotID,
      WarehouseName,
      Category,
      QuantityOnHand,
      PERCENTILE_CONT(0.50)
      within group (order by QuantityOnHand)
      OVER
      (
        partition by WarehouseName, Category 
      )AS QunatityOnHandMedian
from InventorySnapshots
where QuantityOnHand is not null
order by WarehouseName, Category, QuantityOnHand;

