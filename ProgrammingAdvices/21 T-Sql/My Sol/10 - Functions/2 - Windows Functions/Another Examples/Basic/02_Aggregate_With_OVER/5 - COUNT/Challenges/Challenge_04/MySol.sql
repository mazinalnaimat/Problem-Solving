USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      SnapshotID,
      WarehouseName,
      Category,
      ProductName,
      SnapshotDate,
	  COUNT(*)
	  OVER
	  (
		partition by WarehouseName, Category
	  )AS AllSnapshotCount,
	  COUNT(QuantityOnHand)
	  OVER
	  (
		partition by WarehouseName, Category
	  )AS QuantityValueCount 
from InventorySnapshots
ORDER BY WarehouseName, Category, SnapshotDate, SnapshotID;

