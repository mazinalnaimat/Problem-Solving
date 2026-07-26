USE WindowFunctionsTrainingDB;
GO

SELECT
    SnapshotID,
    WarehouseName,
    Category,
    ProductName,
    QuantityOnHand,
    UnitCost,
    CHECKSUM_AGG
    (
        CHECKSUM(ProductName, QuantityOnHand, UnitCost)
    ) OVER
    (
        PARTITION BY WarehouseName, Category
    ) AS InventoryDataChecksum
FROM dbo.InventorySnapshots
ORDER BY WarehouseName, Category, SnapshotID;
