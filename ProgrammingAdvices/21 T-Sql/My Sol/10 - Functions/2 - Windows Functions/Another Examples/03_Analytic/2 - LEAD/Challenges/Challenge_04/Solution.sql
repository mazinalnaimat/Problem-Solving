USE WindowFunctionsTrainingDB;
GO

SELECT
    SnapshotID,
    WarehouseName,
    ProductName,
    SnapshotDate,
    QuantityOnHand,
    LEAD(QuantityOnHand) OVER
    (
        PARTITION BY WarehouseName, ProductName
        ORDER BY SnapshotDate, SnapshotID
    ) AS NextQuantityOnHand
FROM dbo.InventorySnapshots
ORDER BY WarehouseName, ProductName, SnapshotDate, SnapshotID;
