USE RetailOperations3NFDB;
GO

;WITH ProductRevenue AS
(
    SELECT
        p.CategoryID,
        p.ProductID,
        p.ProductName,
        SUM(oi.Quantity * oi.UnitPrice * (1 - oi.DiscountPercent / 100.0)) AS ProductRevenue
    FROM dbo.Products p
    JOIN dbo.OrderItems oi ON oi.ProductID = p.ProductID
    JOIN dbo.SalesOrders o ON o.OrderID = oi.OrderID
    WHERE o.OrderStatusID <> 6
    GROUP BY p.CategoryID, p.ProductID, p.ProductName
),
RankedProducts AS
(
    SELECT
        pr.*,
        DENSE_RANK() OVER
        (
            PARTITION BY pr.CategoryID
            ORDER BY pr.ProductRevenue DESC
        ) AS RevenueRank
    FROM ProductRevenue pr
)
SELECT
    c.CategoryName,
    rp.ProductID,
    rp.ProductName,
    CAST(rp.ProductRevenue AS decimal(14,2)) AS ProductRevenue,
    rp.RevenueRank
FROM RankedProducts rp
JOIN dbo.Categories c ON c.CategoryID = rp.CategoryID
WHERE rp.RevenueRank <= 3
ORDER BY c.CategoryName, rp.RevenueRank, rp.ProductName;
