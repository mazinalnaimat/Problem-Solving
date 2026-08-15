/*
USE RetailOperations3NFDB;
GO
*/
WITH Recursive EmployeeHierarchy AS
(
    SELECT
        e.EmployeeID AS ManagerID,
        e.EmployeeID AS DescendantEmployeeID
    FROM Employees e

    UNION ALL

    SELECT
        eh.ManagerID,
        child.EmployeeID
    FROM EmployeeHierarchy eh
    JOIN Employees child
      ON child.ManagerID = eh.DescendantEmployeeID
),
OrderTotals AS
(
    SELECT
        o.OrderID,
        o.SalesEmployeeID,
        MAKE_DATE
        (
            EXTRACT(YEAR FROM o.OrderDate)::int,
            EXTRACT(MONTH FROM o.OrderDate)::int,
            1
        ) AS MonthStart,
        SUM(oi.Quantity * oi.UnitPrice * (1 - oi.DiscountPercent / 100.0))
        - o.OrderDiscount AS OrderValue
    FROM SalesOrders o
    JOIN OrderItems oi ON oi.OrderID = o.OrderID
    WHERE o.OrderStatusID <> 6
    GROUP BY o.OrderID, o.SalesEmployeeID, o.OrderDate, o.OrderDiscount
),
ManagerMonthlyRevenue AS
(
    SELECT
        eh.ManagerID,
        ot.MonthStart,
        SUM(ot.OrderValue) AS TeamRevenue
    FROM EmployeeHierarchy eh
    JOIN OrderTotals ot
      ON ot.SalesEmployeeID = eh.DescendantEmployeeID
    GROUP BY eh.ManagerID, ot.MonthStart
),
RankedManagers AS
(
    SELECT
        mmr.*,
        RANK() OVER
        (
            PARTITION BY mmr.MonthStart
            ORDER BY mmr.TeamRevenue DESC
        ) AS ManagerRank
    FROM ManagerMonthlyRevenue mmr
)
SELECT
    rm.MonthStart,
    e.EmployeeNumber AS ManagerNumber,
    e.FullName AS ManagerName,
    CAST(rm.TeamRevenue AS decimal(14,2)) AS TeamRevenue,
    rm.ManagerRank
FROM RankedManagers rm
JOIN Employees e ON e.EmployeeID = rm.ManagerID
WHERE EXISTS
(
    SELECT 1
    FROM Employees child
    WHERE child.ManagerID = rm.ManagerID
)
ORDER BY rm.MonthStart, rm.ManagerRank, e.EmployeeNumber
/*OPTION (MAXRECURSION 100);*/



