USE RetailOperations3NFDB;
GO

;WITH ActiveMonths AS
(
    SELECT DISTINCT
        o.CustomerID,
        DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1) AS MonthStart
    FROM dbo.SalesOrders o
    WHERE o.OrderStatusID <> 6
),
NumberedMonths AS
(
    SELECT
        am.*,
        ROW_NUMBER() OVER
        (
            PARTITION BY am.CustomerID
            ORDER BY am.MonthStart
        ) AS MonthSequence
    FROM ActiveMonths am
),
MonthIslands AS
(
    SELECT
        nm.*,
        DATEADD(MONTH, -CONVERT(int,nm.MonthSequence), nm.MonthStart) AS IslandKey
    FROM NumberedMonths nm
),
Streaks AS
(
    SELECT
        CustomerID,
        IslandKey,
        MIN(MonthStart) AS StreakStartMonth,
        MAX(MonthStart) AS StreakEndMonth,
        COUNT(*) AS StreakMonths
    FROM MonthIslands
    GROUP BY CustomerID, IslandKey
),
RankedStreaks AS
(
    SELECT
        s.*,
        ROW_NUMBER() OVER
        (
            PARTITION BY s.CustomerID
            ORDER BY s.StreakMonths DESC, s.StreakEndMonth DESC
        ) AS StreakRank
    FROM Streaks s
)
SELECT
    c.CustomerNumber,
    rs.StreakStartMonth,
    rs.StreakEndMonth,
    rs.StreakMonths
FROM RankedStreaks rs
JOIN dbo.Customers c ON c.CustomerID = rs.CustomerID
WHERE rs.StreakRank = 1
ORDER BY rs.StreakMonths DESC, c.CustomerNumber;
