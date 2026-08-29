USE RetailOperations3NFDB;
GO

;WITH RunningStock AS
(
    SELECT
        it.WarehouseID,
        it.ProductID,
        it.TransactionDate,
        it.InventoryTransactionID,
        it.QuantityChange,
        SUM(it.QuantityChange) OVER
        (
            PARTITION BY it.WarehouseID, it.ProductID
            ORDER BY it.TransactionDate, it.InventoryTransactionID
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS RunningQuantity
    FROM dbo.InventoryTransactions it
)
SELECT
    w.WarehouseCode,
    p.SKU,
    rs.TransactionDate,
    rs.InventoryTransactionID,
    rs.QuantityChange,
    rs.RunningQuantity
FROM RunningStock rs
JOIN dbo.Warehouses w ON w.WarehouseID = rs.WarehouseID
JOIN dbo.Products p ON p.ProductID = rs.ProductID
ORDER BY w.WarehouseCode, p.SKU, rs.TransactionDate, rs.InventoryTransactionID;
