USE WindowFunctionsTrainingDB;
GO

SELECT
    SnapshotID,
    WarehouseName,
    ProductName,
    SnapshotDate,
    QuantityOnHand,
    LAG(QuantityOnHand) OVER
    (
        PARTITION BY WarehouseName, ProductName
        ORDER BY SnapshotDate, SnapshotID
    ) AS PreviousQuantityOnHand
FROM dbo.InventorySnapshots
ORDER BY WarehouseName, ProductName, SnapshotDate, SnapshotID;
