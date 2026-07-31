USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      SnapshotID,
      WarehouseName,
      ProductName,
      SnapshotDate,
      QuantityOnHand,
      LAST_VALUE(QuantityOnHand)
      OVER
      (
        partition by WarehouseName, ProductName
        order by SnapshotDate, SnapshotID
        rows between
        unbounded preceding and unbounded following
      )AS LastQnuantityPerWarehouseProduct
from InventorySnapshots
order by WarehouseName, ProductName, SnapshotDate, SnapshotID;
