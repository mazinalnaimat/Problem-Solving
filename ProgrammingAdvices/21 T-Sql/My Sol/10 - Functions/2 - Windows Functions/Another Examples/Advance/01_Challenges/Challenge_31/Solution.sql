USE RetailOperations3NFDB;
GO

;WITH OrderDelivery AS
(
    SELECT
        s.OrderID,
        s.WarehouseID,
        MAX(s.DeliveredAt) AS FinalDeliveredAt,
        COUNT(*) AS ShipmentCount,
        COUNT(s.DeliveredAt) AS DeliveredShipmentCount
    FROM dbo.Shipments s
    GROUP BY s.OrderID, s.WarehouseID
),
FulfillmentCycles AS
(
    SELECT
        od.WarehouseID,
        od.OrderID,
        DATEDIFF(DAY, o.OrderDate, CAST(od.FinalDeliveredAt AS date)) AS FulfillmentDays
    FROM OrderDelivery od
    JOIN dbo.SalesOrders o ON o.OrderID = od.OrderID
    WHERE od.ShipmentCount = od.DeliveredShipmentCount
),
Percentiles AS
(
    SELECT
        fc.WarehouseID,
        COUNT(*) OVER (PARTITION BY fc.WarehouseID) AS DeliveredOrderCount,
        PERCENTILE_CONT(0.50) WITHIN GROUP
            (ORDER BY fc.FulfillmentDays)
            OVER (PARTITION BY fc.WarehouseID) AS MedianFulfillmentDays,
        PERCENTILE_CONT(0.90) WITHIN GROUP
            (ORDER BY fc.FulfillmentDays)
            OVER (PARTITION BY fc.WarehouseID) AS P90FulfillmentDays
    FROM FulfillmentCycles fc
)
SELECT DISTINCT
    w.WarehouseCode,
    p.DeliveredOrderCount,
    CAST(p.MedianFulfillmentDays AS decimal(9,2)) AS MedianFulfillmentDays,
    CAST(p.P90FulfillmentDays AS decimal(9,2)) AS P90FulfillmentDays
FROM Percentiles p
JOIN dbo.Warehouses w ON w.WarehouseID = p.WarehouseID
ORDER BY w.WarehouseCode;
