USE WindowFunctionsTrainingDB;
GO

SELECT
    SnapshotID,
    WarehouseName,
    Category,
    ProductName,
    SnapshotDate,
    QuantityOnHand,
    MIN(QuantityOnHand) OVER
    (
        PARTITION BY WarehouseName, Category
    ) AS WarehouseCategoryMinimumQuantity
FROM dbo.InventorySnapshots
ORDER BY WarehouseName, Category;
