USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      SnapshotID,
      WarehouseName,
      ProductName,
      SnapshotDate,
      QuantityOnHand,
      LAG(QuantityOnHand)
      OVER
      (
        partition by  WarehouseName, ProductName
        order by SnapshotDate, SnapshotID
      )AS PreviousQunatity
from InventorySnapshots
order by WarehouseName, ProductName, SnapshotDate, SnapshotID;

