
/*
USE RetailOperations3NFDB;
GO
*/

;WITH MonthlyStats AS
(
    SELECT
        o.SalesChannelID,
        MAKE_DATE(EXTRACT (YEAR from o.OrderDate)::int, EXTRACT (MONTH from o.OrderDate)::int, 1) AS MonthStart,
        COUNT(*) AS OrderCount,
        SUM(CASE WHEN o.OrderStatusID = 6 THEN 1 ELSE 0 END) AS CancelledCount
    FROM SalesOrders o
    GROUP BY o.SalesChannelID,
             MAKE_DATE(EXTRACT (YEAR from o.OrderDate)::int, EXTRACT (MONTH from o.OrderDate)::int, 1) 
),
Rates AS
(
    SELECT
        ms.*,
        ms.CancelledCount * 100.0 / NULLIF(ms.OrderCount,0) AS CancellationRate
    FROM MonthlyStats ms
),
MovingRates AS
(
    SELECT
        r.*,
        AVG(r.CancellationRate) OVER
        (
            PARTITION BY r.SalesChannelID
            ORDER BY r.MonthStart
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ) AS ThreeMonthAverageRate
    FROM Rates r
)
SELECT
    sc.ChannelName,
    mr.MonthStart,
    mr.OrderCount,
    mr.CancelledCount,
    CAST(mr.CancellationRate AS decimal(7,2)) AS CancellationRate,
    CAST(mr.ThreeMonthAverageRate AS decimal(7,2)) AS ThreeMonthAverageRate
FROM MovingRates mr
JOIN SalesChannels sc ON sc.SalesChannelID = mr.SalesChannelID
ORDER BY sc.ChannelName, mr.MonthStart;
