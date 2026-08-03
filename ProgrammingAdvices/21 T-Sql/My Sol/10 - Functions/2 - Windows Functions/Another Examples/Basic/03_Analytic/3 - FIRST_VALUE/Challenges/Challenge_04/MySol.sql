USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      SnapshotID,
      WarehouseName,
      ProductName,
      SnapshotDate,
      QuantityOnHand,
	  FIRST_VALUE(QuantityOnHand)
	  OVER
	  (
		partition by WarehouseName, ProductName
		order by SnapshotDate, SnapshotID
	  )AS FirstQuantity
from InventorySnapshots
order by WarehouseName, ProductName, SnapshotDate, SnapshotID;
