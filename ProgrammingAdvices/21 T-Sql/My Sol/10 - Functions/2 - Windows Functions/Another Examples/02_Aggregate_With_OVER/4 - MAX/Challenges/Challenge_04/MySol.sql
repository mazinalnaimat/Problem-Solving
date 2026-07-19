USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.



select 
      SnapshotID,
      WarehouseName,
      Category,
      ProductName,
      SnapshotDate,
	  QuantityOnHand * UnitCost AS InventoryValue,
	  MAX(QuantityOnHand * UnitCost)
	  OVER
	  (
		partition by WarehouseName, Category 
	  )AS WarehouseCategoryMaxValue

from InventorySnapshots
ORDER BY WarehouseName, Category;

