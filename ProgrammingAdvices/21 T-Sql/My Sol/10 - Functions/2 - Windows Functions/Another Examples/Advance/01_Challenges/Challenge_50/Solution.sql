USE RetailOperations3NFDB;
GO

;WITH SequencedOrders AS
(
    SELECT
        o.OrderID,
        o.OrderNumber,
        o.CustomerID,
        o.OrderDate,
        LAG(o.OrderDate) OVER
        (
            PARTITION BY o.CustomerID
            ORDER BY o.OrderDate, o.OrderID
        ) AS PreviousOrderDate
    FROM dbo.SalesOrders o
    WHERE o.OrderStatusID <> 6
)
SELECT
    c.CustomerNumber,
    s.OrderNumber,
    s.OrderDate,
    s.PreviousOrderDate,
    DATEDIFF(DAY, s.PreviousOrderDate, s.OrderDate) AS GapDays
FROM SequencedOrders s
JOIN dbo.Customers c ON c.CustomerID = s.CustomerID
WHERE DATEDIFF(DAY, s.PreviousOrderDate, s.OrderDate) > 45
ORDER BY GapDays DESC, c.CustomerNumber, s.OrderDate;
