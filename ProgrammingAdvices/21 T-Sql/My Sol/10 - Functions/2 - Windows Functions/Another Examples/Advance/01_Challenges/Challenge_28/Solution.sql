USE RetailOperations3NFDB;
GO

;WITH OrderTotals AS
(
    SELECT
        o.OrderID,
        o.CustomerID,
        o.OrderDate,
        SUM(oi.Quantity * oi.UnitPrice * (1 - oi.DiscountPercent / 100.0))
            - o.OrderDiscount AS OrderValue
    FROM dbo.SalesOrders o
    JOIN dbo.OrderItems oi ON oi.OrderID = o.OrderID
    WHERE o.OrderStatusID <> 6
    GROUP BY o.OrderID, o.CustomerID, o.OrderDate, o.OrderDiscount
),
AnalysisDate AS
(
    SELECT DATEADD(DAY,1,MAX(OrderDate)) AS AsOfDate
    FROM OrderTotals
),
CustomerMetrics AS
(
    SELECT
        ot.CustomerID,
        DATEDIFF(DAY, MAX(ot.OrderDate), ad.AsOfDate) AS DaysSinceLastOrder,
        COUNT(*) AS OrderCount,
        SUM(ot.OrderValue) AS LifetimeValue
    FROM OrderTotals ot
    CROSS JOIN AnalysisDate ad
    GROUP BY ot.CustomerID, ad.AsOfDate
),
Scores AS
(
    SELECT
        cm.*,
        NTILE(5) OVER (ORDER BY cm.DaysSinceLastOrder DESC) AS RecencyScore,
        NTILE(5) OVER (ORDER BY cm.OrderCount) AS FrequencyScore,
        NTILE(5) OVER (ORDER BY cm.LifetimeValue) AS MonetaryScore
    FROM CustomerMetrics cm
)
SELECT
    c.CustomerNumber,
    s.DaysSinceLastOrder,
    s.OrderCount,
    CAST(s.LifetimeValue AS decimal(14,2)) AS LifetimeValue,
    s.RecencyScore,
    s.FrequencyScore,
    s.MonetaryScore,
    CONCAT(s.RecencyScore, s.FrequencyScore, s.MonetaryScore) AS RFMCode
FROM Scores s
JOIN dbo.Customers c ON c.CustomerID = s.CustomerID
ORDER BY RFMCode DESC, s.LifetimeValue DESC, c.CustomerNumber;
