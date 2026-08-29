USE RetailOperations3NFDB;
GO


;WITH OrderTotals AS
(
    SELECT
        o.OrderID,
        o.SalesEmployeeID,
        DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1) AS MonthStart,
        SUM(oi.Quantity * oi.UnitPrice * (1 - oi.DiscountPercent / 100.0))
            - o.OrderDiscount AS OrderValue
    FROM dbo.SalesOrders o
    JOIN dbo.OrderItems oi ON oi.OrderID = o.OrderID
    WHERE o.OrderStatusID <> 6
    GROUP BY o.OrderID, o.SalesEmployeeID, o.OrderDate, o.OrderDiscount
),
MonthlySales AS
(
    SELECT SalesEmployeeID, MonthStart, SUM(OrderValue) AS MonthlyRevenue
    FROM OrderTotals
    GROUP BY SalesEmployeeID, MonthStart
),
RankedSales AS
(
    SELECT
        ms.*,
        RANK() OVER
        (
            PARTITION BY ms.MonthStart
            ORDER BY ms.MonthlyRevenue DESC
        ) AS RevenueRank
    FROM MonthlySales ms
)
SELECT
    rs.MonthStart,
    e.EmployeeNumber,
    e.FullName,
    CAST(rs.MonthlyRevenue AS decimal(14,2)) AS MonthlyRevenue,
    rs.RevenueRank
FROM RankedSales rs
JOIN dbo.Employees e ON e.EmployeeID = rs.SalesEmployeeID
ORDER BY rs.MonthStart, rs.RevenueRank, e.EmployeeNumber;
