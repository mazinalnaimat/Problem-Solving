USE WindowFunctionsTrainingDB;
GO

SELECT
    SnapshotID,
    WarehouseName,
    Category,
    SnapshotDate,
    UnitCost,
    STDEVP
    (
        CASE WHEN UnitCost > 20 THEN UnitCost END
    ) OVER
    (
        PARTITION BY WarehouseName, Category
        ORDER BY SnapshotDate, SnapshotID
    ) AS ConditionalRunningUnitCostPopulationDeviation
FROM dbo.InventorySnapshots
ORDER BY WarehouseName, Category, SnapshotDate, SnapshotID;
