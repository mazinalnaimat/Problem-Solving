USE WindowFunctionsTrainingDB;
GO

SELECT
    SnapshotID,
    Category,
    WarehouseName,
    QuantityOnHand,
    CUME_DIST() OVER
    (
        PARTITION BY Category
        ORDER BY QuantityOnHand
    ) AS DistributionValue
FROM dbo.InventorySnapshots
WHERE QuantityOnHand IS NOT NULL
ORDER BY Category, QuantityOnHand;
