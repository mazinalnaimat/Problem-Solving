/*
USE RetailOperations3NFDB;
GO
 */


/*
Challenge 14: Longest Negative Inventory-Movement Streak
Difficulty: Hard

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/

/*

select * from Warehouses;
select * from Products;
select * from InventoryTransactions
where InventoryTransactions.quantitychange <0;
select * from inventorytransactiontypes;
 */

with FlagTransactions as
(
    select 
          IT.*,
          (case when quantitychange < 0 then 1 else 0 end) AS IsNegative
    from InventoryTransactions AS IT
),
FT_ConsqNegTr as
(
    select
          NT.*,
          SUM(IsNegative)
          OVER
          (
              partition by warehouseid, ProductID
              order by TransactionDate, InventoryTransactionID
              rows between 
              unbounded preceding and current row 
          ) AS ConsequitiveNegativeTransactions
    from FlagTransactions AS NT
)


select
      WH.WarehouseCode,
      Pr.SKU,
      MIN(TransactionDate) AS StreakStart,
      MAX(TransactionDate) AS StreakEnd,
      MAX(ConsequitiveNegativeTransactions) AS NegativeTransactions,
      SUM(-1 * QuantityChange) AS TotalQuantityDecrease      
from FT_ConsqNegTr AS FT_CNT
join WareHouses AS WH
    on WH.warehouseid = FT_CNT.warehouseid
join Products AS Pr
    on Pr.productid = FT_CNT.productid
where FT_CNT.IsNegative =1
group by WH.WarehouseCode, Pr.SKU
order by  WH.WarehouseCode, Pr.SKU

