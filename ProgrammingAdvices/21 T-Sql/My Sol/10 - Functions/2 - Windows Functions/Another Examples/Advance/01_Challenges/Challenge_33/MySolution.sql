USE RetailOperations3NFDB;
GO

/*
Challenge 33: ABC Inventory Classification
Difficulty: Hard

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/
/*
select * from InventoryTransactions
where InventoryTransactions.InventoryTransactionTypeID = 1
select * from InventoryTransactionTypes
*/
;WITH ProductConsumption AS
(
    select
          IT.WarehouseID,
          IT.ProductID,
          SUM(-IT.QuantityChange * IT.UnitCost) AS ConsumptionValue
    from InventoryTransactions AS IT
    join InventoryTransactionTypes AS  ITT
        on IT.InventoryTransactionTypeID = ITT.InventoryTransactionTypeID
    where ITT.InventoryTransactionTypeID = 3 /*'SALE_ISSUE'*/
    group by IT.WarehouseID, IT.ProductID
),
ConsumptionCurve AS
(
    select
          PC.*,
          SUM(PC.ConsumptionValue) 
          OVER
          (
              partition by PC.WarehouseID
              order by PC.ConsumptionValue DESC, PC.ProductID
              rows between unbounded preceding and current row
          ) AS CumulativeValue,
          SUM(PC.ConsumptionValue)
          OVER
          (
              partition by PC.WarehouseID
          ) AS WarehouseConsumptionValue
    from ProductConsumption AS PC
),
WithConsumptionPercent AS
(
    SELECT
          CC.*,
          CC.CumulativeValue * 100.0 / NULLIF(CC.WarehouseConsumptionValue,0)
          AS CumulativePercent
    FROM ConsumptionCurve AS CC
)

select 
      Wh.WarehouseCode,
      Prc.SKU,
      WCP.ConsumptionValue,
      WCP.CumulativePercent,
      CASE
        WHEN WCP.CumulativePercent > 95
            THEN
            'C'
        WHEN 
            WCP.CumulativePercent > 80
            THEN
            'B'
        ELSE
            'A'
      END AS ABCClass
from WithConsumptionPercent AS WCP
join Warehouses AS Wh
    on WCP.WarehouseID = Wh.WarehouseID
join Products AS Prc
    on WCP.ProductID = Prc.ProductID
order by Wh.WarehouseCode, WCP.CumulativePercent, Prc.SKU;
