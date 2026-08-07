USE RetailOperations3NFDB;
GO

;WITH MonthlyIssues AS
(
    SELECT
        it.WarehouseID,
        DATEFROMPARTS(YEAR(it.TransactionDate), MONTH(it.TransactionDate), 1) AS MonthStart,
        SUM(-it.QuantityChange) AS UnitsIssued
    FROM dbo.InventoryTransactions it
    JOIN dbo.InventoryTransactionTypes tt
      ON tt.InventoryTransactionTypeID = it.InventoryTransactionTypeID
    WHERE tt.TypeCode = 'SALE_ISSUE'
    GROUP BY it.WarehouseID,
             DATEFROMPARTS(YEAR(it.TransactionDate), MONTH(it.TransactionDate), 1)
),
RankedWarehouses AS
(
    SELECT
        mi.*,
        DENSE_RANK() OVER
        (
            PARTITION BY mi.MonthStart
            ORDER BY mi.UnitsIssued DESC
        ) AS MonthlyRank
    FROM MonthlyIssues mi
)
SELECT
    rw.MonthStart,
    w.WarehouseCode,
    rw.UnitsIssued,
    rw.MonthlyRank
FROM RankedWarehouses rw
JOIN dbo.Warehouses w ON w.WarehouseID = rw.WarehouseID
ORDER BY rw.MonthStart, rw.MonthlyRank, w.WarehouseCode;
