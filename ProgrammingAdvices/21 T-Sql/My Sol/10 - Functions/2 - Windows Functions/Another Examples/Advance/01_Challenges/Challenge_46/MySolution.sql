USE RetailOperations3NFDB;
GO

/*
Challenge 46: Running Inventory Balance
Difficulty: Medium

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/



WITH RunningStock AS
(
    select
          IT.WarehouseID,
          IT.ProductID,
          IT.TransactionDate,
          IT.InventoryTransactionID,
          IT.QuantityChange,
          SUM(it.QuantityChange) 
          OVER
          (
              partition by  IT.WarehouseID, IT.ProductID
              order by IT.TransactionDate, IT.InventoryTransactionID
              rows between unbounded preceding and current row
          ) AS RunningQuantity
    from InventoryTransactions IT
)
SELECT
    Wh.WarehouseCode,
    Prc.SKU,
    rs.TransactionDate,
    rs.InventoryTransactionID,
    rs.QuantityChange,
    rs.RunningQuantity
from RunningStock AS RS
join Warehouses AS Wh 
    on Wh.WarehouseID = Rs.WarehouseID
join Products AS Prc 
    on Prc.ProductID = rs.ProductID
order by Wh.WarehouseCode, Prc.SKU, RS.TransactionDate, RS.InventoryTransactionID;









