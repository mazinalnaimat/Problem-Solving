/*
USE RetailOperations3NFDB;
GO
*/

;WITH BalanceEvents AS
(
    SELECT
        it.WarehouseID,
        it.ProductID,
        it.TransactionDate,
        it.InventoryTransactionID,
        SUM(it.QuantityChange) OVER
        (
            PARTITION BY it.WarehouseID, it.ProductID
            ORDER BY it.TransactionDate, it.InventoryTransactionID
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS RunningQuantity
    FROM InventoryTransactions it
),
EventIntervals AS
(
    SELECT
        be.*,
        LEAD(be.TransactionDate) OVER
        (
            PARTITION BY be.WarehouseID, be.ProductID
            ORDER BY be.TransactionDate, be.InventoryTransactionID
        ) AS NextTransactionDate,
        CASE WHEN be.RunningQuantity <= 0 THEN 1 ELSE 0 END AS IsOutOfStock
    FROM BalanceEvents be
),
Transitions AS
(
    SELECT
        ei.*,
        CASE
            WHEN ei.IsOutOfStock = 1
            AND COALESCE(
                LAG(ei.IsOutOfStock) OVER (
                    PARTITION BY ei.WarehouseID, ei.ProductID
                    ORDER BY ei.TransactionDate, ei.InventoryTransactionID
                ),
                0
            ) = 0
            THEN 1
            ELSE 0
        END AS StartsNewPeriod
    FROM EventIntervals ei
),
GroupedEvents AS
(
    SELECT
        t.*,
        SUM(t.StartsNewPeriod) OVER
        (
            PARTITION BY t.WarehouseID, t.ProductID
            ORDER BY t.TransactionDate, t.InventoryTransactionID
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS PeriodGroup
    FROM Transitions t
),
DatasetEnd AS
(
    SELECT MAX(TransactionDate) AS MaxTransactionDate
    FROM InventoryTransactions
),
OutOfStockPeriods AS
(
    SELECT
        ge.WarehouseID,
        ge.ProductID,
        ge.PeriodGroup,
        MIN(ge.TransactionDate) AS OutOfStockStart,
        MAX(COALESCE(ge.NextTransactionDate, de.MaxTransactionDate)) AS RecoveryDate,
        SUM(
            EXTRACT(
                EPOCH FROM (
                    COALESCE(ge.NextTransactionDate, de.MaxTransactionDate)
                    - ge.TransactionDate
                )
            ) / 86400.0
        ) AS OutOfStockDays
    FROM GroupedEvents ge
    CROSS JOIN DatasetEnd de
    WHERE ge.IsOutOfStock = 1
    GROUP BY ge.WarehouseID, ge.ProductID, ge.PeriodGroup
),
RankedPeriods AS
(
    SELECT
        oop.*,
        ROW_NUMBER() OVER
        (
            PARTITION BY oop.WarehouseID, oop.ProductID
            ORDER BY oop.OutOfStockDays DESC, oop.OutOfStockStart
        ) AS PeriodRank
    FROM OutOfStockPeriods oop
)
SELECT
    w.WarehouseCode,
    p.SKU,
    rp.OutOfStockStart,
    rp.RecoveryDate,
    CAST(rp.OutOfStockDays AS decimal(12,2)) AS OutOfStockDays
FROM RankedPeriods rp
JOIN Warehouses w ON w.WarehouseID = rp.WarehouseID
JOIN Products p ON p.ProductID = rp.ProductID
WHERE rp.PeriodRank = 1
ORDER BY rp.OutOfStockDays DESC, w.WarehouseCode, p.SKU;
