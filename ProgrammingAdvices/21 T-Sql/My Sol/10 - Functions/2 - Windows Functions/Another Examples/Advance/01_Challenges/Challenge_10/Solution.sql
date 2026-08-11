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
GrowthComparison AS
(
    SELECT
        ms.*,
        LAG(ms.MonthStart) OVER
        (
            PARTITION BY ms.SalesEmployeeID
            ORDER BY ms.MonthStart
        ) AS PreviousMonth,
        LAG(ms.MonthlyRevenue) OVER
        (
            PARTITION BY ms.SalesEmployeeID
            ORDER BY ms.MonthStart
        ) AS PreviousRevenue
    FROM MonthlySales ms
),
QualifyingMonths AS
(
    SELECT
        gc.*,
        ROW_NUMBER() OVER
        (
            PARTITION BY gc.SalesEmployeeID
            ORDER BY gc.MonthStart
        ) AS QualifiedSequence
    FROM GrowthComparison gc
    WHERE gc.MonthlyRevenue > gc.PreviousRevenue
      AND DATEDIFF(MONTH, gc.PreviousMonth, gc.MonthStart) = 1
),
GrowthIslands AS
(
    SELECT
        qm.*,
        DATEADD(MONTH, -CONVERT(int,qm.QualifiedSequence), qm.MonthStart) AS IslandKey
    FROM QualifyingMonths qm
),
Streaks AS
(
    SELECT
        SalesEmployeeID,
        IslandKey,
        MIN(MonthStart) AS StreakStartMonth,
        MAX(MonthStart) AS StreakEndMonth,
        COUNT(*) AS GrowthMonths
    FROM GrowthIslands
    GROUP BY SalesEmployeeID, IslandKey
),
RankedStreaks AS
(
    SELECT
        s.*,
        ROW_NUMBER() OVER
        (
            PARTITION BY s.SalesEmployeeID
            ORDER BY s.GrowthMonths DESC, s.StreakEndMonth DESC
        ) AS StreakRank
    FROM Streaks s
)
SELECT
    e.EmployeeNumber,
    rs.StreakStartMonth,
    rs.StreakEndMonth,
    rs.GrowthMonths
FROM RankedStreaks rs
JOIN dbo.Employees e ON e.EmployeeID = rs.SalesEmployeeID
WHERE rs.StreakRank = 1
ORDER BY rs.GrowthMonths DESC, e.EmployeeNumber;
