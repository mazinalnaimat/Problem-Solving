/*
USE RetailOperations3NFDB;
GO
*/

/*
Challenge 21: Longest Out-of-Stock Period
Difficulty: Hard

Write your solution beloWh.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/


;WITH BalanceEvents AS
(
    select
        IT.WarehouseID,
        IT.ProductID,
        IT.TransactionDate,
        IT.InventoryTransactionID,
        SUM(IT.QuantityChange)
        OVER
        (
            partition by IT.WarehouseID, IT.ProductID
            order by IT.TransactionDate, IT.InventoryTransactionID
            rows between unbounded preceding and current row
        ) AS RunningQuantity
    from InventoryTransactions as IT
),
EventIntervals AS
(
    select
          BE.*,
          LEAD(BE.TransactionDate) 
          OVER
          (
              partition by BE.WarehouseID, BE.ProductID
              order by BE.TransactionDate, BE.InventoryTransactionID
          ) AS NextTransactionDate,
          case when BE.RunningQuantity <= 0 then 1 else 0 end AS IsOutOfStock
    from BalanceEvents AS BE
),
Transitions AS
(
    select
          EI.*,
          case
              when EI.IsOutOfStock = 1
              AND 
              COALESCE
              (
                  LAG(EI.IsOutOfStock) 
                  OVER 
                  (
                      partition by  EI.WarehouseID, EI.ProductID
                      order by EI.TransactionDate, EI.InventoryTransactionID
                  ),
                  0
              ) = 0
              then 1
              else 0
          end AS StartsNewPeriod
    from EventIntervals AS EI
),
GroupedEvents AS
(
    select
          Tr.*,
          SUM(Tr.StartsNewPeriod)
          OVER
          (
              partition by Tr.WarehouseID, Tr.ProductID
              order by Tr.TransactionDate, Tr.InventoryTransactionID
              rows between unbounded preceding and current row
          ) AS PeriodGroup
    from Transitions AS Tr
),
DatasetEnd AS
(
    select MAX(TransactionDate) AS MaxTransactionDate
    from InventoryTransactions
),
OutOfStockPeriods AS
(
    select
          GE.WarehouseID,
          GE.ProductID,
          GE.PeriodGroup,
          MIN(ge.TransactionDate) AS OutOfStockStart,
          MAX(COALESCE(ge.NextTransactionDate, DE.MaxTransactionDate)) AS RecoveryDate,
          SUM(
              EXTRACT(
                  EPOCH from (
                      COALESCE(ge.NextTransactionDate, DE.MaxTransactionDate)
                      - GE.TransactionDate
                  )
              ) / 86400.0
          ) AS OutOfStockDays
    from GroupedEvents AS GE
    cross join DatasetEnd AS DE
    where GE.IsOutOfStock = 1
    group by GE.WarehouseID, GE.ProductID, GE.PeriodGroup
),
RankedPeriods AS
(
    select
          OOP.*,
          ROW_NUMBER() 
          OVER
          (
              partition by  OOP.WarehouseID, OOP.ProductID
              order by OOP.OutOfStockDays DESC, OOP.OutOfStockStart
          ) AS PeriodRank
    from OutOfStockPeriods AS OOP
)
select
      Wh.WarehouseCode,
      Pr.SKU,
      RP.OutOfStockStart,
      RP.RecoveryDate,
      CAST(RP.OutOfStockDays AS decimal(12,2)) AS OutOfStockDays
from RankedPeriods AS RP
join Warehouses AS Wh 
    on Wh.WarehouseID = RP.WarehouseID
join Products AS Pr 
    on Pr.ProductID = RP.ProductID
where RP.PeriodRank = 1
order by RP.OutOfStockDays DESC, Wh.WarehouseCode, Pr.SKU;