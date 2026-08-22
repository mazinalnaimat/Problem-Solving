USE RetailOperations3NFDB;
GO

;WITH ProductConsumption AS
(
    SELECT
        it.WarehouseID,
        it.ProductID,
        SUM(-it.QuantityChange * it.UnitCost) AS ConsumptionValue
    FROM InventoryTransactions it
    JOIN InventoryTransactionTypes tt
      ON tt.InventoryTransactionTypeID = it.InventoryTransactionTypeID
    WHERE tt.TypeCode = 'SALE_ISSUE'
    GROUP BY it.WarehouseID, it.ProductID
),
ConsumptionCurve AS
(
    SELECT
        pc.*,
        SUM(pc.ConsumptionValue) OVER
        (
            PARTITION BY pc.WarehouseID
            ORDER BY pc.ConsumptionValue DESC, pc.ProductID
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS CumulativeValue,
        SUM(pc.ConsumptionValue) OVER
        (
            PARTITION BY pc.WarehouseID
        ) AS WarehouseConsumptionValue
    FROM ProductConsumption pc
),
Classified AS
(
    SELECT
        cc.*,
        cc.CumulativeValue * 100.0 / NULLIF(cc.WarehouseConsumptionValue,0)
            AS CumulativePercent
    FROM ConsumptionCurve cc
)
SELECT
    w.WarehouseCode,
    p.SKU,
    CAST(c.ConsumptionValue AS decimal(14,2)) AS ConsumptionValue,
    CAST(c.CumulativePercent AS decimal(7,2)) AS CumulativePercent,
    CASE
        WHEN c.CumulativePercent <= 80 THEN 'A'
        WHEN c.CumulativePercent <= 95 THEN 'B'
        ELSE 'C'
    END AS ABCClass
FROM Classified c
JOIN Warehouses w ON w.WarehouseID = c.WarehouseID
JOIN Products p ON p.ProductID = c.ProductID
ORDER BY w.WarehouseCode, c.CumulativePercent, p.SKU;
