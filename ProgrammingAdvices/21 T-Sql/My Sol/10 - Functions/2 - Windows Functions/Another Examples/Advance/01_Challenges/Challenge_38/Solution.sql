USE RetailOperations3NFDB;
GO

;WITH OrderTotals AS
(
    SELECT
        o.OrderID,
        o.OrderNumber,
        o.CustomerID,
        o.OrderDate,
        SUM(oi.Quantity * oi.UnitPrice * (1 - oi.DiscountPercent / 100.0))
            - o.OrderDiscount AS OrderValue
    FROM dbo.SalesOrders o
    JOIN dbo.OrderItems oi ON oi.OrderID = o.OrderID
    WHERE o.OrderStatusID <> 6
    GROUP BY o.OrderID, o.OrderNumber, o.CustomerID, o.OrderDate, o.OrderDiscount
),
RollingComparison AS
(
    SELECT
        ot.*,
        AVG(ot.OrderValue) OVER
        (
            PARTITION BY ot.CustomerID
            ORDER BY ot.OrderDate, ot.OrderID
            ROWS BETWEEN 3 PRECEDING AND 1 PRECEDING
        ) AS PreviousThreeAverage,
        COUNT(*) OVER
        (
            PARTITION BY ot.CustomerID
            ORDER BY ot.OrderDate, ot.OrderID
            ROWS BETWEEN 3 PRECEDING AND 1 PRECEDING
        ) AS PreviousOrderCount
    FROM OrderTotals ot
)
SELECT
    c.CustomerNumber,
    rc.OrderNumber,
    rc.OrderDate,
    CAST(rc.OrderValue AS decimal(14,2)) AS OrderValue,
    CAST(rc.PreviousThreeAverage AS decimal(14,2)) AS PreviousThreeAverage,
    CAST((rc.OrderValue / NULLIF(rc.PreviousThreeAverage,0) - 1) * 100 AS decimal(9,2))
        AS PercentAboveAverage
FROM RollingComparison rc
JOIN dbo.Customers c ON c.CustomerID = rc.CustomerID
WHERE rc.PreviousOrderCount = 3
  AND rc.OrderValue >= rc.PreviousThreeAverage * 1.50
ORDER BY PercentAboveAverage DESC, c.CustomerNumber, rc.OrderDate;
