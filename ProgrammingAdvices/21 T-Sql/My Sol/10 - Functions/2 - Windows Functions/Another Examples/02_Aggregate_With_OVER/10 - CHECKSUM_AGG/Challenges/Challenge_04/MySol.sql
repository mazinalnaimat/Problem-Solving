USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
      SnapshotID,
      WarehouseName,
      Category,
      ProductName,
      QuantityOnHand,
      UnitCost,
      CHECKSUM_AGG
      (
        CHECKSUM(ProductName, QuantityOnHand, UnitCost)
      )
      OVER
      (
        partition by WarehouseName, Category
      )AS InventoryDataCheckSum
from InventorySnapshots
order by WarehouseName, Category, SnapshotID;


