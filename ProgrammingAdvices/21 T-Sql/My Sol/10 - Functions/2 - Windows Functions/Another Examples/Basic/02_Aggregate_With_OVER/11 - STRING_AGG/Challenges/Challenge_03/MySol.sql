USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select distinct
      WarehouseName,
      Category,
      STRING_AGG
      (
        CONVERT
        (
            nvarchar(max),
            CONCAT(ProductName, ' [', QuantityOnHand, ' @ ', UnitCost, ']')
        ),
        '; '
      )
      within group
      (order by SnapshotDate, SnapshotID) AS SnapshotDescriptions
from InventorySnapshots

group by WarehouseName, Category
order by WarehouseName, Category
