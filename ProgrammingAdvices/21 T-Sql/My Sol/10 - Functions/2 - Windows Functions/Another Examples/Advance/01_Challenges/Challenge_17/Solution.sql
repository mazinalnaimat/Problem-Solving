/*
USE RetailOperations3NFDB;
GO
*/
;WITH OrderSequence AS
(
    SELECT
        o.CustomerID,
        o.OrderID,
        o.OrderDate,
        LAG(o.OrderDate) OVER
        (
            PARTITION BY o.CustomerID
            ORDER BY o.OrderDate, o.OrderID
        ) AS PreviousOrderDate,
        COUNT(*) OVER
        (
            PARTITION BY o.CustomerID
        ) AS OrderCount,
        MAX(o.OrderDate) OVER
        (
            PARTITION BY o.CustomerID
        ) AS LastOrderDate
    FROM SalesOrders o
    WHERE o.OrderStatusID <> 6
),
OrderGaps AS
(
    SELECT
        os.*,
        (os.PreviousOrderDate - os.OrderDate)  AS GapDays

    FROM OrderSequence os
    WHERE os.PreviousOrderDate IS NOT NULL
),
CustomerMedianGaps AS
(
    SELECT
        og.CustomerID,          
        PERCENTILE_CONT(0.5)WITHIN GROUP(ORDER BY og.GapDays) AS MedianGapDays
    FROM OrderGaps AS og
    GROUP by og.CustomerID
),
MedianGaps AS
(
    SELECT
        og.CustomerID,
        og.OrderCount,
        og.LastOrderDate,
        cmg.MedianGapDays AS MedianGapDays
    FROM OrderGaps AS og 
    JOIN CustomerMedianGaps AS cmg ON og.CustomerID = cmg.CustomerID 
),
AnalysisDate AS
(
    SELECT MAX(OrderDate) + INTERVAL '60 days' AS AsOfDate
    FROM SalesOrders
    WHERE OrderStatusID <> 6
)
SELECT DISTINCT
    c.CustomerNumber,
    mg.OrderCount,
    mg.LastOrderDate,
    CAST(mg.MedianGapDays AS decimal(9,2)) AS MedianGapDays,
    EXTRACT(DAY FROM (ad.AsOfDate - mg.LastOrderDate)) AS DaysSinceLastOrder,
    CAST(
        EXTRACT(DAY FROM (ad.AsOfDate - mg.LastOrderDate))
        / NULLIF(mg.MedianGapDays, 0)
        AS decimal(9,2)
    ) AS GapMultiple
FROM MedianGaps mg
CROSS JOIN AnalysisDate ad
JOIN Customers c ON c.CustomerID = mg.CustomerID
WHERE mg.OrderCount >= 3
  AND EXTRACT(DAY FROM (mg.LastOrderDate - ad.AsOfDate)) > mg.MedianGapDays * 2
ORDER BY GapMultiple DESC, c.CustomerNumber;
