USE RetailOperations3NFDB;
GO

;WITH CurrentStock AS
(
    SELECT
        it.ProductID,
        it.WarehouseID,
        SUM(it.QuantityChange) AS CurrentQuantity
    FROM dbo.InventoryTransactions it
    GROUP BY it.ProductID, it.WarehouseID
),
RankedStock AS
(
    SELECT
        cs.*,
        RANK() OVER
        (
            PARTITION BY cs.ProductID
            ORDER BY cs.CurrentQuantity DESC
        ) AS StockRank
    FROM CurrentStock cs
)
SELECT
    p.SKU,
    w.WarehouseCode,
    rs.CurrentQuantity,
    rs.StockRank
FROM RankedStock rs
JOIN dbo.Products p ON p.ProductID = rs.ProductID
JOIN dbo.Warehouses w ON w.WarehouseID = rs.WarehouseID
WHERE rs.StockRank = 1
ORDER BY p.SKU, w.WarehouseCode;
