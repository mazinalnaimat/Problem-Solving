USE RetailOperations3NFDB;
GO

;WITH QuarterlyCategorySales AS
(
    SELECT
        YEAR(o.OrderDate) AS SalesYear,
        DATEPART(QUARTER, o.OrderDate) AS SalesQuarter,
        p.CategoryID,
        SUM(oi.Quantity * oi.UnitPrice * (1 - oi.DiscountPercent / 100.0)) AS QuarterRevenue
    FROM dbo.SalesOrders o
    JOIN dbo.OrderItems oi ON oi.OrderID = o.OrderID
    JOIN dbo.Products p ON p.ProductID = oi.ProductID
    WHERE o.OrderStatusID <> 6
    GROUP BY YEAR(o.OrderDate), DATEPART(QUARTER, o.OrderDate), p.CategoryID
),
RankedCategories AS
(
    SELECT
        qcs.*,
        RANK() OVER
        (
            PARTITION BY qcs.SalesYear, qcs.SalesQuarter
            ORDER BY qcs.QuarterRevenue DESC
        ) AS CategoryRank
    FROM QuarterlyCategorySales qcs
)
SELECT
    rc.SalesYear,
    rc.SalesQuarter,
    c.CategoryName,
    CAST(rc.QuarterRevenue AS decimal(14,2)) AS QuarterRevenue,
    rc.CategoryRank
FROM RankedCategories rc
JOIN dbo.Categories c ON c.CategoryID = rc.CategoryID
ORDER BY rc.SalesYear, rc.SalesQuarter, rc.CategoryRank, c.CategoryName;
