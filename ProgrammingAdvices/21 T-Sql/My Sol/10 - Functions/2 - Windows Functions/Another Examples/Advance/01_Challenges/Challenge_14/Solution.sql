/*
USE RetailOperations3NFDB;
GO
*/
;WITH MovementFlags AS
(
    SELECT
        it.*,
        CASE WHEN it.QuantityChange < 0 THEN 1 ELSE 0 END AS IsNegative
    FROM dbo.InventoryTransactions it
),
MovementGroups AS
(
    SELECT
        mf.*,
        SUM(CASE WHEN mf.IsNegative = 0 THEN 1 ELSE 0 END) OVER
        (
            PARTITION BY mf.WarehouseID, mf.ProductID
            ORDER BY mf.TransactionDate, mf.InventoryTransactionID
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS StreakGroup
    FROM MovementFlags mf
),
NegativeStreaks AS
(
    SELECT
        mg.WarehouseID,
        mg.ProductID,
        mg.StreakGroup,
        MIN(mg.TransactionDate) AS StreakStart,
        MAX(mg.TransactionDate) AS StreakEnd,
        COUNT(*) AS NegativeTransactions,
        SUM(-mg.QuantityChange) AS TotalQuantityDecrease
    FROM MovementGroups mg
    WHERE mg.IsNegative = 1
    GROUP BY mg.WarehouseID, mg.ProductID, mg.StreakGroup
),
RankedStreaks AS
(
    SELECT
        ns.*,
        ROW_NUMBER() OVER
        (
            PARTITION BY ns.WarehouseID, ns.ProductID
            ORDER BY ns.NegativeTransactions DESC,
                     ns.TotalQuantityDecrease DESC,
                     ns.StreakStart
        ) AS StreakRank
    FROM NegativeStreaks ns
)
SELECT
    w.WarehouseCode,
    p.SKU,
    rs.StreakStart,
    rs.StreakEnd,
    rs.NegativeTransactions,
    rs.TotalQuantityDecrease
FROM RankedStreaks rs
JOIN dbo.Warehouses w ON w.WarehouseID = rs.WarehouseID
JOIN dbo.Products p ON p.ProductID = rs.ProductID
WHERE rs.StreakRank = 1
ORDER BY rs.NegativeTransactions DESC, w.WarehouseCode, p.SKU;
