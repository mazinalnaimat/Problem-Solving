USE RetailOperations3NFDB;
GO

;WITH DeliverySequence AS
(
    SELECT
        s.WarehouseID,
        s.ShipmentNumber,
        s.ShipmentID,
        s.DeliveredAt,
        LAG(s.DeliveredAt) OVER
        (
            PARTITION BY s.WarehouseID
            ORDER BY s.DeliveredAt, s.ShipmentID
        ) AS PreviousDeliveredAt
    FROM dbo.Shipments s
    WHERE s.DeliveredAt IS NOT NULL
)
SELECT
    w.WarehouseCode,
    ds.ShipmentNumber,
    ds.DeliveredAt,
    ds.PreviousDeliveredAt,
    DATEDIFF(HOUR, ds.PreviousDeliveredAt, ds.DeliveredAt) AS GapHours
FROM DeliverySequence ds
JOIN dbo.Warehouses w ON w.WarehouseID = ds.WarehouseID
ORDER BY w.WarehouseCode, ds.DeliveredAt, ds.ShipmentNumber;
