USE WindowFunctionsTrainingDB;
GO

SELECT
    SnapshotID,
    WarehouseName,
    Category,
    ProductName,
    SnapshotDate,
    COUNT(*) OVER
    (
        PARTITION BY WarehouseName, Category
    ) AS AllSnapshotCount,
    COUNT(QuantityOnHand) OVER
    (
        PARTITION BY WarehouseName, Category
    ) AS QuantityValueCount
FROM dbo.InventorySnapshots
ORDER BY WarehouseName, Category, SnapshotDate, SnapshotID;
