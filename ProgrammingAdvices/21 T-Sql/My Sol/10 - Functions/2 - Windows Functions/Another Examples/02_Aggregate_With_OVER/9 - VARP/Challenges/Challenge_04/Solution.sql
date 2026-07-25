USE WindowFunctionsTrainingDB;
GO

SELECT
    SnapshotID,
    WarehouseName,
    Category,
    SnapshotDate,
    UnitCost,
    VARP
    (
        CASE WHEN UnitCost > 0 THEN UnitCost END
    ) OVER
    (
        PARTITION BY WarehouseName, Category
        ORDER BY SnapshotDate, SnapshotID
    ) AS ConditionalRunningUnitCostPopulationVariance
FROM dbo.InventorySnapshots
ORDER BY WarehouseName, Category, SnapshotDate, SnapshotID;
