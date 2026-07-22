USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      SnapshotID,
      WarehouseName,
      Category,
      SnapshotDate,
      QuantityOnHand,
      VAR(case when QuantityOnHand > 0 then QuantityOnHand   end)
      OVER
      (
        partition by WarehouseName, Category
        order by SnapshotDate, SnapshotID
      ) AS RunningQuanGrThZeroPerHouseCateSamDev
from InventorySnapshots

order by WarehouseName, Category, SnapshotDate, SnapshotID
