USE RetailOperations3NFDB;
GO

;WITH OrderDelivery AS
(
    SELECT
        s.OrderID,
        COUNT(*) AS ShipmentCount,
        COUNT(s.DeliveredAt) AS DeliveredShipmentCount,
        MAX(s.DeliveredAt) AS FinalDeliveredAt
    FROM dbo.Shipments s
    GROUP BY s.OrderID
),
MonthlyDeliveryStats AS
(
    SELECT
        o.SalesChannelID,
        DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1) AS MonthStart,
        COUNT(*) AS DeliveredOrders,
        SUM(CASE WHEN CAST(od.FinalDeliveredAt AS date) > o.RequiredDate
                 THEN 1 ELSE 0 END) AS DelayedOrders
    FROM OrderDelivery od
    JOIN dbo.SalesOrders o ON o.OrderID = od.OrderID
    WHERE od.ShipmentCount = od.DeliveredShipmentCount
    GROUP BY o.SalesChannelID,
             DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1)
),
RollingCounts AS
(
    SELECT
        mds.*,
        SUM(mds.DeliveredOrders) OVER
        (
            PARTITION BY mds.SalesChannelID
            ORDER BY mds.MonthStart
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ) AS RollingDeliveredOrders,
        SUM(mds.DelayedOrders) OVER
        (
            PARTITION BY mds.SalesChannelID
            ORDER BY mds.MonthStart
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ) AS RollingDelayedOrders
    FROM MonthlyDeliveryStats mds
)
SELECT
    sc.ChannelName,
    rc.MonthStart,
    rc.DeliveredOrders,
    rc.DelayedOrders,
    CAST(rc.RollingDelayedOrders * 100.0 / NULLIF(rc.RollingDeliveredOrders,0)
         AS decimal(7,2)) AS Rolling3MonthDelayRate
FROM RollingCounts rc
JOIN dbo.SalesChannels sc ON sc.SalesChannelID = rc.SalesChannelID
ORDER BY sc.ChannelName, rc.MonthStart;
