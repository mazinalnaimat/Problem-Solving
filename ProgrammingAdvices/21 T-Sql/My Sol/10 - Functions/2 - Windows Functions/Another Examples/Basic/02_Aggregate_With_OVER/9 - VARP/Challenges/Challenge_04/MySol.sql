USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      SnapshotID,
      WarehouseName,
      Category,
      SnapshotDate,
      UnitCost,
      VARP(Case when UnitCost > 0 then UnitCost end)
      OVER
      (
        partition by WarehouseName, Category
        order by SnapshotDate, SnapshotID 
      )AS RunningUnitCostGreThnZeroPopVar
from InventorySnapshots
order by WarehouseName, Category, SnapshotDate, SnapshotID
