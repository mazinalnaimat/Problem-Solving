USE WindowFunctionsTrainingDB;
GO

SELECT
    SnapshotID,
    WarehouseName,
    Category,
    SnapshotDate,
    QuantityOnHand,
    VAR
    (
        CASE WHEN QuantityOnHand > 0 THEN CAST(QuantityOnHand AS decimal(10,2)) END
    ) OVER
    (
        PARTITION BY WarehouseName, Category
        ORDER BY SnapshotDate, SnapshotID
    ) AS ConditionalRunningQuantitySampleVariance
FROM dbo.InventorySnapshots
ORDER BY WarehouseName, Category, SnapshotDate, SnapshotID;
