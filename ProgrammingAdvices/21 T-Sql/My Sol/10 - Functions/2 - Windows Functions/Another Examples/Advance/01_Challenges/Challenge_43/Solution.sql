USE RetailOperations3NFDB;
GO

;WITH ProductRevenue AS
(
    SELECT
        p.CategoryID,
        p.ProductID,
        p.SKU,
        SUM(oi.Quantity * oi.UnitPrice * (1 - oi.DiscountPercent / 100.0)) AS ProductRevenue
    FROM dbo.Products p
    JOIN dbo.OrderItems oi ON oi.ProductID = p.ProductID
    JOIN dbo.SalesOrders o ON o.OrderID = oi.OrderID
    WHERE o.OrderStatusID <> 6
    GROUP BY p.CategoryID, p.ProductID, p.SKU
),
RevenueCurve AS
(
    SELECT
        pr.*,
        ROW_NUMBER() OVER
        (
            PARTITION BY pr.CategoryID
            ORDER BY pr.ProductRevenue DESC, pr.ProductID
        ) AS RevenuePosition,
        SUM(pr.ProductRevenue) OVER
        (
            PARTITION BY pr.CategoryID
            ORDER BY pr.ProductRevenue DESC, pr.ProductID
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS CumulativeRevenue,
        SUM(pr.ProductRevenue) OVER
        (
            PARTITION BY pr.CategoryID
        ) AS CategoryRevenue
    FROM ProductRevenue pr
),
ThresholdLogic AS
(
    SELECT
        rc.*,
        (rc.CumulativeRevenue - rc.ProductRevenue) * 100.0
            / NULLIF(rc.CategoryRevenue,0) AS PreviousCumulativePercent
    FROM RevenueCurve rc
)
SELECT
    c.CategoryName,
    tl.SKU,
    CAST(tl.ProductRevenue AS decimal(14,2)) AS ProductRevenue,
    CAST(tl.CumulativeRevenue * 100.0 / NULLIF(tl.CategoryRevenue,0) AS decimal(7,2))
        AS CumulativeRevenuePercent,
    tl.RevenuePosition
FROM ThresholdLogic tl
JOIN dbo.Categories c ON c.CategoryID = tl.CategoryID
WHERE tl.PreviousCumulativePercent < 80
ORDER BY c.CategoryName, tl.RevenuePosition, tl.SKU;
