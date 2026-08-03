USE WindowFunctionsTrainingDB;
GO

SELECT
    SnapshotID,
    WarehouseName,
    Category,
    QuantityOnHand,
    PERCENTILE_DISC(0.50) WITHIN GROUP (ORDER BY QuantityOnHand)
        OVER (PARTITION BY WarehouseName, Category) AS PercentileValue
FROM dbo.InventorySnapshots
WHERE QuantityOnHand IS NOT NULL
ORDER BY WarehouseName, Category, QuantityOnHand;
