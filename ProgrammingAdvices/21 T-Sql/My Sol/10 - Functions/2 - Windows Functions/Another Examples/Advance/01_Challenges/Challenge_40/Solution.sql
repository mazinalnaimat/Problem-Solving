USE RetailOperations3NFDB;
GO

;WITH MonthlyDemand AS
(
    SELECT
        oi.ProductID,
        DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1) AS MonthStart,
        SUM(oi.Quantity) AS UnitsSold
    FROM dbo.OrderItems oi
    JOIN dbo.SalesOrders o ON o.OrderID = oi.OrderID
    WHERE o.OrderStatusID <> 6
    GROUP BY oi.ProductID,
             DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1)
),
DemandStats AS
(
    SELECT
        p.CategoryID,
        md.ProductID,
        COUNT(*) AS ActiveMonths,
        AVG(md.UnitsSold * 1.0) AS AverageMonthlyUnits,
        STDEV(md.UnitsSold * 1.0) AS MonthlyStdDev
    FROM MonthlyDemand md
    JOIN dbo.Products p ON p.ProductID = md.ProductID
    GROUP BY p.CategoryID, md.ProductID
    HAVING COUNT(*) >= 6
),
Variability AS
(
    SELECT
        ds.*,
        ds.MonthlyStdDev / NULLIF(ds.AverageMonthlyUnits,0) AS CoefficientOfVariation
    FROM DemandStats ds
),
RankedStability AS
(
    SELECT
        v.*,
        DENSE_RANK() OVER
        (
            PARTITION BY v.CategoryID
            ORDER BY v.CoefficientOfVariation, v.ProductID
        ) AS StabilityRank
    FROM Variability v
)
SELECT
    c.CategoryName,
    p.SKU,
    rs.ActiveMonths,
    CAST(rs.AverageMonthlyUnits AS decimal(10,2)) AS AverageMonthlyUnits,
    CAST(rs.MonthlyStdDev AS decimal(10,2)) AS MonthlyStdDev,
    CAST(rs.CoefficientOfVariation AS decimal(9,4)) AS CoefficientOfVariation,
    rs.StabilityRank
FROM RankedStability rs
JOIN dbo.Products p ON p.ProductID = rs.ProductID
JOIN dbo.Categories c ON c.CategoryID = rs.CategoryID
ORDER BY c.CategoryName, rs.StabilityRank, p.SKU;
