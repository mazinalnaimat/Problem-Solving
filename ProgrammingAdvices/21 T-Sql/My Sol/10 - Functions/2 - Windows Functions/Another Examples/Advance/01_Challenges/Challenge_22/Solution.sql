
/*USE RetailOperations3NFDB;
GO
*/
;WITH OrderTotals AS
(
    SELECT
        o.OrderID,
        o.CustomerID,
        MAKE_DATE(EXTRACT(YEAR FROM o.OrderDate)::int, EXTRACT(MONTH FROM o.OrderDate)::int, 1) AS MonthStart,
        SUM(oi.Quantity * oi.UnitPrice * (1 - oi.DiscountPercent / 100.0))
            - o.OrderDiscount AS OrderValue
    FROM SalesOrders o
    JOIN OrderItems oi ON oi.OrderID = o.OrderID
    WHERE o.OrderStatusID <> 6
    GROUP BY o.OrderID, o.CustomerID, o.OrderDate, o.OrderDiscount
),
MonthlySpend AS
(
    SELECT CustomerID, MonthStart, SUM(OrderValue) AS MonthlySpend
    FROM OrderTotals
    GROUP BY CustomerID, MonthStart
),
WithPrevious AS
(
    SELECT
        CustomerID,
        MonthStart,
        MonthlySpend,
        LAG(MonthlySpend) OVER
        (
            PARTITION BY CustomerID
            ORDER BY MonthStart
        ) AS PreviousMonthSpend
    FROM MonthlySpend
)
SELECT
    c.CustomerNumber,
    c.FullName,
    w.MonthStart,
    CAST(w.MonthlySpend AS decimal(14,2)) AS MonthlySpend,
    CAST(w.PreviousMonthSpend AS decimal(14,2)) AS PreviousMonthSpend,
    CAST(w.MonthlySpend - w.PreviousMonthSpend AS decimal(14,2)) AS SpendChange
FROM WithPrevious w
JOIN Customers c ON c.CustomerID = w.CustomerID
ORDER BY c.CustomerNumber, w.MonthStart;
