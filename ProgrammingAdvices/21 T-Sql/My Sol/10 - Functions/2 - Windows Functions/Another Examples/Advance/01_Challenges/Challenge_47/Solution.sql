USE RetailOperations3NFDB;
GO

;WITH DateBounds AS
(
    SELECT MIN(OrderDate) AS MinDate, MAX(OrderDate) AS MaxDate
    FROM dbo.SalesOrders
),
Calendar AS
(
    SELECT MinDate AS CalendarDate, MaxDate
    FROM DateBounds

    UNION ALL

    SELECT DATEADD(DAY,1,CalendarDate), MaxDate
    FROM Calendar
    WHERE CalendarDate < MaxDate
),
OrderTotals AS
(
    SELECT
        o.OrderID,
        o.SalesChannelID,
        o.OrderDate,
        SUM(oi.Quantity * oi.UnitPrice * (1 - oi.DiscountPercent / 100.0))
            - o.OrderDiscount AS OrderValue
    FROM dbo.SalesOrders o
    JOIN dbo.OrderItems oi ON oi.OrderID = o.OrderID
    WHERE o.OrderStatusID <> 6
    GROUP BY o.OrderID, o.SalesChannelID, o.OrderDate, o.OrderDiscount
),
DailyRevenue AS
(
    SELECT
        c.CalendarDate,
        sc.SalesChannelID,
        COALESCE(SUM(ot.OrderValue),0) AS DailyRevenue
    FROM Calendar c
    CROSS JOIN dbo.SalesChannels sc
    LEFT JOIN OrderTotals ot
      ON ot.SalesChannelID = sc.SalesChannelID
     AND ot.OrderDate = c.CalendarDate
    GROUP BY c.CalendarDate, sc.SalesChannelID
),
RollingRevenue AS
(
    SELECT
        dr.*,
        SUM(dr.DailyRevenue) OVER
        (
            PARTITION BY dr.SalesChannelID
            ORDER BY dr.CalendarDate
            ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
        ) AS Rolling30DayRevenue
    FROM DailyRevenue dr
)
SELECT
    rr.CalendarDate,
    sc.ChannelName,
    CAST(rr.DailyRevenue AS decimal(14,2)) AS DailyRevenue,
    CAST(rr.Rolling30DayRevenue AS decimal(14,2)) AS Rolling30DayRevenue
FROM RollingRevenue rr
JOIN dbo.SalesChannels sc ON sc.SalesChannelID = rr.SalesChannelID
ORDER BY sc.ChannelName, rr.CalendarDate
OPTION (MAXRECURSION 0);
