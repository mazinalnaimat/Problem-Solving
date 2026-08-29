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
BoundaryValues AS
(
    SELECT
        ot.CustomerID,
        FIRST_VALUE(ot.OrderDate) OVER
        (
            PARTITION BY ot.CustomerID
            ORDER BY ot.OrderDate, ot.OrderID
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) AS FirstOrderDate,
        FIRST_VALUE(ot.OrderValue) OVER
        (
            PARTITION BY ot.CustomerID
            ORDER BY ot.OrderDate, ot.OrderID
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) AS FirstOrderValue,
        LAST_VALUE(ot.OrderDate) OVER
        (
            PARTITION BY ot.CustomerID
            ORDER BY ot.OrderDate, ot.OrderID
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) AS LatestOrderDate,
        LAST_VALUE(ot.OrderValue) OVER
        (
            PARTITION BY ot.CustomerID
            ORDER BY ot.OrderDate, ot.OrderID
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) AS LatestOrderValue
    FROM OrderTotals ot
)
SELECT DISTINCT
    c.CustomerNumber,
    bv.FirstOrderDate,
    CAST(bv.FirstOrderValue AS decimal(14,2)) AS FirstOrderValue,
    bv.LatestOrderDate,
    CAST(bv.LatestOrderValue AS decimal(14,2)) AS LatestOrderValue,
    CAST(bv.LatestOrderValue - bv.FirstOrderValue AS decimal(14,2)) AS ValueChange
FROM BoundaryValues bv
JOIN dbo.Customers c ON c.CustomerID = bv.CustomerID
ORDER BY c.CustomerNumber;
