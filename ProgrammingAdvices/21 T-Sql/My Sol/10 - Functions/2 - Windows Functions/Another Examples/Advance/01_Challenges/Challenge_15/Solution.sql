/*
USE RetailOperations3NFDB;
GO
*/




;WITH OrderTotals AS
(
    SELECT
        o.OrderID,
        o.OrderNumber,
        o.CustomerID,
        o.OrderDate,
        SUM(oi.Quantity * oi.UnitPrice * (1 - oi.DiscountPercent / 100.0))
            - o.OrderDiscount AS OrderValue
    FROM SalesOrders o
    JOIN OrderItems oi ON oi.OrderID = o.OrderID
    WHERE o.OrderStatusID <> 6
    GROUP BY o.OrderID, o.OrderNumber, o.CustomerID, o.OrderDate, o.OrderDiscount
),
CustomerValue AS
(
    SELECT
        ot.*,
        SUM(ot.OrderValue) OVER
        (
            PARTITION BY ot.CustomerID
        ) AS CustomerLifetimeValue
    FROM OrderTotals ot
)
SELECT
    c.CustomerNumber,
    cv.OrderNumber,
    cv.OrderDate,
    CAST(cv.OrderValue AS decimal(14,2)) AS OrderValue,
    CAST(cv.CustomerLifetimeValue AS decimal(14,2)) AS CustomerLifetimeValue,
    CAST(cv.OrderValue * 100.0 / NULLIF(cv.CustomerLifetimeValue,0) AS decimal(9,2))
        AS OrderSharePercent
FROM CustomerValue cv
JOIN Customers c ON c.CustomerID = cv.CustomerID
ORDER BY c.CustomerNumber, cv.OrderDate, cv.OrderNumber;

drop Database dbo

select * from dbo.brands
