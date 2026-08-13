/*USE RetailOperations3NFDB;
GO*/

;WITH ShipmentWindows AS
(
    SELECT
        s.OrderID,
        s.ShipmentID,
        COUNT(*) OVER (PARTITION BY s.OrderID) AS ShipmentCount,
        COUNT(s.DeliveredAt) OVER (PARTITION BY s.OrderID) AS DeliveredShipmentCount,
        MIN(s.ShippedAt) OVER (PARTITION BY s.OrderID) AS FirstShippedAt,
        MAX(s.DeliveredAt) OVER (PARTITION BY s.OrderID) AS FinalDeliveredAt,
        ROW_NUMBER() OVER
        (
            PARTITION BY s.OrderID
            ORDER BY s.ShipmentID
        ) AS OrderRow
    FROM dbo.Shipments s
)
SELECT
    o.OrderNumber,
    sw.ShipmentCount,
    sw.FirstShippedAt,
    sw.FinalDeliveredAt,
    -- Hours difference between two timestamps
    EXTRACT(EPOCH FROM (sw.FinalDeliveredAt - sw.FirstShippedAt))::integer / 3600 AS FulfillmentHours,

    -- Days difference between two dates
    (sw.FinalDeliveredAt::date - o.RequiredDate::date) AS DelayDays
    
FROM ShipmentWindows sw
JOIN dbo.SalesOrders o ON o.OrderID = sw.OrderID
WHERE sw.OrderRow = 1
  AND sw.ShipmentCount > 1
  AND sw.ShipmentCount = sw.DeliveredShipmentCount
ORDER BY DelayDays DESC, o.OrderNumber;
