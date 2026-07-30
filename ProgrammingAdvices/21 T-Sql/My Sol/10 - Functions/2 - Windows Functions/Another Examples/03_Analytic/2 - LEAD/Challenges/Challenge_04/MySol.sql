USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      SnapshotID,
      WarehouseName,
      ProductName,
      SnapshotDate,
      QuantityOnHand,
      LEAD(QuantityOnHand)
      OVER
      (
        partition by WarehouseName, ProductName
        order by SnapshotDate, SnapshotID
      )
      AS NextInventoryQuantity
from InventorySnapshots
order by WarehouseName, ProductName, SnapshotDate, SnapshotID;

