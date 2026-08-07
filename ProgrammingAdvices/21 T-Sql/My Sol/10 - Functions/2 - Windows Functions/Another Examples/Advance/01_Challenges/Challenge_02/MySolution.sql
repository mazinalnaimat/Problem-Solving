USE RetailOperations3NFDB;
GO

/*
Challenge 02: Warehouse Monthly Sales-Issue Ranking
Difficulty: Medium

WrITe your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/


;WITH MonthlyIssues AS
(
    select
        IT.WarehouseID,
        DATEFROMPARTS(YEAR(IT.TransactionDate), MONTH(IT.TransactionDate), 1) AS MonthStart,
        SUM(-IT.QuantITyChange) AS UnITsIssued
    from InventoryTransactions IT
    join InventoryTransactionTypes ITT
      on ITT.InventoryTransactionTypeID = IT.InventoryTransactionTypeID
    where ITT.TypeCode = 'SALE_ISSUE'
    group by IT.WarehouseID,
             DATEFROMPARTS(YEAR(IT.TransactionDate), MONTH(IT.TransactionDate), 1)
),
RankedWarehouses AS
(
    select
        MI.*,
        DENSE_RANK() OVER
        (
            partition by MI.MonthStart
            order by MI.UnitsIssued DESC
        ) AS MonthlyRank
    from MonthlyIssues MI
)

select
    RW.MonthStart,
    Wh.WarehouseCode,
    RW.UnitsIssued,
    RW.MonthlyRank
from RankedWarehouses RW
join Warehouses Wh
   ON Wh.WarehouseID = RW.WarehouseID
order by RW.MonthStart, RW.MonthlyRank, Wh.WarehouseCode;

