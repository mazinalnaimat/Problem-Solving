/*
USE RetailOperations3NFDB;
GO
*/

;WITH DailyOrderSequence AS
(
    SELECT
        o.CustomerID,
        o.OrderDate,
        o.OrderNumber,
        ROW_NUMBER() OVER
        (
            PARTITION BY o.CustomerID, o.OrderDate
            ORDER BY o.OrderID
        ) AS DailyOrderSequence,
        COUNT(*) OVER
        (
            PARTITION BY o.CustomerID, o.OrderDate
        ) AS DailyOrderCount
    FROM dbo.SalesOrders o
)
SELECT
    c.CustomerNumber,
    d.OrderDate,
    d.OrderNumber,
    d.DailyOrderSequence,
    d.DailyOrderCount
FROM DailyOrderSequence d
JOIN dbo.Customers c ON c.CustomerID = d.CustomerID
WHERE d.DailyOrderCount >= 2
ORDER BY c.CustomerNumber, d.OrderDate, d.DailyOrderSequence;
