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
OrderSequence AS
(
    SELECT
        ot.*,
        ROW_NUMBER() OVER
        (
            PARTITION BY ot.CustomerID
            ORDER BY ot.OrderDate, ot.OrderID
        ) AS OrderSequence,
        LEAD(ot.OrderDate) OVER
        (
            PARTITION BY ot.CustomerID
            ORDER BY ot.OrderDate, ot.OrderID
        ) AS SecondOrderDate,
        LEAD(ot.OrderValue) OVER
        (
            PARTITION BY ot.CustomerID
            ORDER BY ot.OrderDate, ot.OrderID
        ) AS SecondOrderValue
    FROM OrderTotals ot
)
SELECT
    c.CustomerNumber,
    os.OrderDate AS FirstOrderDate,
    CAST(os.OrderValue AS decimal(14,2)) AS FirstOrderValue,
    os.SecondOrderDate,
    CAST(os.SecondOrderValue AS decimal(14,2)) AS SecondOrderValue,
    DATEDIFF(DAY, os.OrderDate, os.SecondOrderDate) AS DaysToSecondOrder,
    CAST(os.SecondOrderValue - os.OrderValue AS decimal(14,2)) AS ValueChange
FROM OrderSequence os
JOIN dbo.Customers c ON c.CustomerID = os.CustomerID
WHERE os.OrderSequence = 1
  AND os.SecondOrderDate IS NOT NULL
ORDER BY DaysToSecondOrder, c.CustomerNumber;
