USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

Select 
      SnapshotID,
      WarehouseName,
      Category,
      SnapshotDate,
      QuantityOnHand,
      STDEV
      (
      CASE 
            When QuantityOnHand< 100 then
            CAST(QuantityOnHand AS decimal(10,2))
       END
      )
      OVER
      (
        partition by WarehouseName, Category
        order by SnapshotDate, SnapshotID
      )AS RunningStockSampleDev_StockBelow100
from InventorySnapshots
ORDER BY WarehouseName, Category, SnapshotDate, SnapshotID;


