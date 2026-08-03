USE WindowFunctionsTrainingDB;
GO

SELECT
    WarehouseName,
    Category,
    STRING_AGG
    (
        CONVERT
        (
            nvarchar(max),
            CONCAT(ProductName, ' [', QuantityOnHand, ' @ ', UnitCost, ']')
        ),
        '; '
    ) WITHIN GROUP (ORDER BY SnapshotDate, SnapshotID) AS SnapshotDescriptions
FROM dbo.InventorySnapshots
GROUP BY WarehouseName, Category
ORDER BY WarehouseName, Category;
