USE WindowFunctionsTrainingDB;
GO

SELECT
    SnapshotID,
    WarehouseName,
    Category,
    ProductName,
    SnapshotDate,
    QuantityOnHand * UnitCost AS InventoryValue,
    MAX(QuantityOnHand * UnitCost) OVER
    (
        PARTITION BY WarehouseName, Category
    ) AS WarehouseCategoryMaximumValue
FROM dbo.InventorySnapshots
ORDER BY WarehouseName, Category;
