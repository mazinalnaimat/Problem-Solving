USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      SnapshotID,
      Category,
      WarehouseName,
      QuantityOnHand,
	  PERCENT_RANK()
	  OVER
	  (
		partition by Category 
		order by QuantityOnHand
	  )AS QunatityPerCategoryPercentRank
from InventorySnapshots
where QuantityOnHand is not null
order by Category, QuantityOnHand

