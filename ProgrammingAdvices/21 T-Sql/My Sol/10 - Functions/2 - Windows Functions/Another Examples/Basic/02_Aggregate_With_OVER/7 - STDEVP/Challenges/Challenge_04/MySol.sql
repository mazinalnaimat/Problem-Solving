USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      SnapshotID,
      WarehouseName,
      Category,
      SnapshotDate,
      UnitCost,      
      STDEVP(CASE when UnitCost > 20 then UnitCost End)
      OVER
      (
          partition by WarehouseName, Category
          order by SnapshotDate, SnapshotID
            
      )  AS RunningUnitCostPopStdDev 
from InventorySnapshots
order by WarehouseName, Category, SnapshotDate, SnapshotID

