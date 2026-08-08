USE RetailOperations3NFDB;
GO

;WITH OrderTotals AS
(
    SELECT
        o.OrderID,
        o.CustomerID,
        SUM(oi.Quantity * oi.UnitPrice * (1 - oi.DiscountPercent / 100.0))
            - o.OrderDiscount AS OrderValue
    FROM dbo.SalesOrders o
    JOIN dbo.OrderItems oi ON oi.OrderID = o.OrderID
    WHERE o.OrderStatusID <> 6
    GROUP BY o.OrderID, o.CustomerID, o.OrderDiscount
),
CustomerRevenue AS
(
    SELECT
        r.RegionID,
        ot.CustomerID,
        SUM(ot.OrderValue) AS CustomerRevenue
    FROM OrderTotals ot
    JOIN dbo.Customers c ON c.CustomerID = ot.CustomerID
    JOIN dbo.Cities ci ON ci.CityID = c.CityID
    JOIN dbo.Countries co ON co.CountryID = ci.CountryID
    JOIN dbo.Regions r ON r.RegionID = co.RegionID
    GROUP BY r.RegionID, ot.CustomerID
),
RevenueCurve AS
(
    SELECT
        cr.*,
        ROW_NUMBER() OVER
        (
            PARTITION BY cr.RegionID
            ORDER BY cr.CustomerRevenue DESC, cr.CustomerID
        ) AS RevenuePosition,
        SUM(cr.CustomerRevenue) OVER
        (
            PARTITION BY cr.RegionID
            ORDER BY cr.CustomerRevenue DESC, cr.CustomerID
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS CumulativeRevenue,
        SUM(cr.CustomerRevenue) OVER
        (
            PARTITION BY cr.RegionID
        ) AS RegionRevenue
    FROM CustomerRevenue cr
),
Threshold AS
(
    SELECT
        rc.*,
        (rc.CumulativeRevenue - rc.CustomerRevenue) * 100.0
            / NULLIF(rc.RegionRevenue,0) AS PreviousPercent
    FROM RevenueCurve rc
)
SELECT
    r.RegionName,
    c.CustomerNumber,
    CAST(t.CustomerRevenue AS decimal(14,2)) AS CustomerRevenue,
    CAST(t.CumulativeRevenue * 100.0 / NULLIF(t.RegionRevenue,0) AS decimal(7,2))
        AS CumulativeRevenuePercent,
    t.RevenuePosition
FROM Threshold t
JOIN dbo.Regions r ON r.RegionID = t.RegionID
JOIN dbo.Customers c ON c.CustomerID = t.CustomerID
WHERE t.PreviousPercent < 80
ORDER BY r.RegionName, t.RevenuePosition, c.CustomerNumber;
