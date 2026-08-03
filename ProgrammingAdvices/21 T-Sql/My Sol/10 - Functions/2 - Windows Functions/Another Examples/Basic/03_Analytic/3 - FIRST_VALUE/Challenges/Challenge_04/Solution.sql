USE WindowFunctionsTrainingDB;
GO

SELECT
    SnapshotID,
    WarehouseName,
    ProductName,
    SnapshotDate,
    QuantityOnHand,
    FIRST_VALUE(QuantityOnHand) OVER
    (
        PARTITION BY WarehouseName, ProductName
        ORDER BY SnapshotDate, SnapshotID
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS FirstQuantityOnHand
FROM dbo.InventorySnapshots
ORDER BY WarehouseName, ProductName, SnapshotDate, SnapshotID;
