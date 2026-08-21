USE RetailOperations3NFDB;
GO

/*
Challenge 30: Best Warehouse Stock Position per Product
Difficulty: Medium

Write your solution beloWh.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/

;WITH CurrentStock AS
(
    select
        IT.ProductID,
        IT.WarehouseID,
        SUM(IT.QuantityChange) AS CurrentQuantity
    from InventoryTransactions AS IT
    group by IT.ProductID, IT.WarehouseID
),
RankedStock AS
(
    select
        CS.*,
        RANK()
        OVER
        (
            partition by CS.ProductID
            order by CS.CurrentQuantity DESC
        ) AS StockRank
    from CurrentStock AS CS
)
select
    Prc.SKU,
    Wh.WarehouseCode,
    rs.CurrentQuantity,
    rs.StockRank
from RankedStock rs
join Products AS Prc
    on Prc.ProductID = rs.ProductID
join Warehouses AS Wh 
    on Wh.WarehouseID = rs.WarehouseID
where rs.StockRank = 1
order by Prc.SKU, Wh.WarehouseCode;