/*
USE RetailOperations3NFDB;
GO
*/
;WITH MonthlyCategoryRevenue AS
(
    SELECT
        MAKE_DATE( EXTRACT(YEAR from o.OrderDate)::int, EXTRACT(MONTH from o.OrderDate)::int, 1) AS MonthStart,
        p.CategoryID,
        SUM(oi.Quantity * oi.UnitPrice * (1 - oi.DiscountPercent / 100.0)) AS CategoryRevenue
    FROM SalesOrders o
    JOIN OrderItems oi ON oi.OrderID = o.OrderID
    JOIN Products p ON p.ProductID = oi.ProductID
    WHERE o.OrderStatusID <> 6
    GROUP BY MAKE_DATE( EXTRACT(YEAR from o.OrderDate)::int, EXTRACT(MONTH from o.OrderDate)::int, 1),
             p.CategoryID
),
WithMonthTotal AS
(
    SELECT
        mcr.*,
        SUM(mcr.CategoryRevenue) OVER
        (
            PARTITION BY mcr.MonthStart
        ) AS MonthRevenue
    FROM MonthlyCategoryRevenue mcr
)
SELECT
    wmt.MonthStart,
    c.CategoryName,
    CAST(wmt.CategoryRevenue AS decimal(14,2)) AS CategoryRevenue,
    CAST(wmt.MonthRevenue AS decimal(14,2)) AS MonthRevenue,
    CAST(wmt.CategoryRevenue * 100.0 / NULLIF(wmt.MonthRevenue,0) AS decimal(7,2))
        AS RevenueSharePercent
FROM WithMonthTotal wmt
JOIN Categories c ON c.CategoryID = wmt.CategoryID
ORDER BY wmt.MonthStart, RevenueSharePercent DESC, c.CategoryName;
