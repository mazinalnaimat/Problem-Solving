USE RetailOperations3NFDB;
GO

;WITH OrderTotals AS
(
    SELECT
        o.OrderID,
        o.CustomerID,
        DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1) AS MonthStart,
        SUM(oi.Quantity * oi.UnitPrice * (1 - oi.DiscountPercent / 100.0))
            - o.OrderDiscount AS OrderValue
    FROM dbo.SalesOrders o
    JOIN dbo.OrderItems oi ON oi.OrderID = o.OrderID
    WHERE o.OrderStatusID <> 6
    GROUP BY o.OrderID, o.CustomerID, o.OrderDate, o.OrderDiscount
),
RegionalMonthlyRevenue AS
(
    SELECT
        r.RegionID,
        ot.MonthStart,
        SUM(ot.OrderValue) AS MonthlyRevenue
    FROM OrderTotals ot
    JOIN dbo.Customers c ON c.CustomerID = ot.CustomerID
    JOIN dbo.Cities ci ON ci.CityID = c.CityID
    JOIN dbo.Countries co ON co.CountryID = ci.CountryID
    JOIN dbo.Regions r ON r.RegionID = co.RegionID
    GROUP BY r.RegionID, ot.MonthStart
),
MonthBounds AS
(
    SELECT MIN(MonthStart) AS MinMonth, MAX(MonthStart) AS MaxMonth
    FROM OrderTotals
),
CalendarMonths AS
(
    SELECT MinMonth AS MonthStart, MaxMonth
    FROM MonthBounds

    UNION ALL

    SELECT DATEADD(MONTH,1,MonthStart), MaxMonth
    FROM CalendarMonths
    WHERE MonthStart < MaxMonth
),
RegionMonthSpine AS
(
    SELECT
        r.RegionID,
        cm.MonthStart,
        COALESCE(rmr.MonthlyRevenue,0) AS MonthlyRevenue
    FROM dbo.Regions r
    CROSS JOIN CalendarMonths cm
    LEFT JOIN RegionalMonthlyRevenue rmr
      ON rmr.RegionID = r.RegionID
     AND rmr.MonthStart = cm.MonthStart
),
WithPriorYear AS
(
    SELECT
        rms.*,
        LAG(rms.MonthlyRevenue,12) OVER
        (
            PARTITION BY rms.RegionID
            ORDER BY rms.MonthStart
        ) AS PreviousYearRevenue
    FROM RegionMonthSpine rms
)
SELECT
    r.RegionName,
    wpy.MonthStart,
    CAST(wpy.MonthlyRevenue AS decimal(14,2)) AS MonthlyRevenue,
    CAST(wpy.PreviousYearRevenue AS decimal(14,2)) AS PreviousYearRevenue,
    CAST((wpy.MonthlyRevenue / NULLIF(wpy.PreviousYearRevenue,0) - 1) * 100
         AS decimal(9,2)) AS YoYGrowthPercent
FROM WithPriorYear wpy
JOIN dbo.Regions r ON r.RegionID = wpy.RegionID
WHERE wpy.PreviousYearRevenue IS NOT NULL
ORDER BY r.RegionName, wpy.MonthStart
OPTION (MAXRECURSION 0);
