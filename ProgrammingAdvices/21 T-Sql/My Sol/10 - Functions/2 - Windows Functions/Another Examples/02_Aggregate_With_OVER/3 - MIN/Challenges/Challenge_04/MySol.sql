USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      SnapshotID,
      WarehouseName,
      Category,
      ProductName,
      SnapshotDate,
      QuantityOnHand,
      MIN(QuantityOnHand)
      OVER
      ( 
        partition by WarehouseName, Category
      )AS WarehouseCategoryMinQuantity
from InventorySnapshots
order by WarehouseName, Category
