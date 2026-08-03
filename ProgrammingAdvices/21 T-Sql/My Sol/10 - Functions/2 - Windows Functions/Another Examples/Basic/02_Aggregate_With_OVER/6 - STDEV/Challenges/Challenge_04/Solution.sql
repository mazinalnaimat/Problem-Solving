USE WindowFunctionsTrainingDB;
GO

SELECT
    SnapshotID,
    WarehouseName,
    Category,
    SnapshotDate,
    QuantityOnHand,
    STDEV
    (
        CASE WHEN QuantityOnHand < 100 THEN CAST(QuantityOnHand AS decimal(10,2)) END
    ) OVER
    (
        PARTITION BY WarehouseName, Category
        ORDER BY SnapshotDate, SnapshotID
    ) AS ConditionalRunningLowStockSampleDeviation
FROM dbo.InventorySnapshots
ORDER BY WarehouseName, Category, SnapshotDate, SnapshotID;
