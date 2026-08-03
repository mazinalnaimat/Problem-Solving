USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
      SnapshotID,
      Category,
      WarehouseName,
      QuantityOnHand,
      CUME_DIST()
      OVER
      (
        partition by Category
        order by QuantityOnHand
      )AS QuantityPerCategoryCumeDist
from InventorySnapshots
where QuantityOnHand is not null
order by Category, QuantityOnHand;