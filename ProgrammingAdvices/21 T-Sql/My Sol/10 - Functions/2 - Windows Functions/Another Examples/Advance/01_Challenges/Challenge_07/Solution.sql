USE RetailOperations3NFDB;
GO

;WITH PriceHistory AS
(
    SELECT
        oi.ProductID,
        o.OrderNumber,
        o.OrderDate,
        o.OrderID,
        oi.OrderItemID,
        oi.UnitPrice,
        LAG(oi.UnitPrice) OVER
        (
            PARTITION BY oi.ProductID
            ORDER BY o.OrderDate, o.OrderID, oi.OrderItemID
        ) AS PreviousUnitPrice
    FROM dbo.OrderItems oi
    JOIN dbo.SalesOrders o ON o.OrderID = oi.OrderID
    WHERE o.OrderStatusID <> 6
)
SELECT
    p.SKU,
    ph.OrderNumber,
    ph.OrderDate,
    ph.UnitPrice,
    ph.PreviousUnitPrice,
    CAST((ph.UnitPrice / NULLIF(ph.PreviousUnitPrice,0) - 1) * 100 AS decimal(9,2))
        AS PriceChangePercent
FROM PriceHistory ph
JOIN dbo.Products p ON p.ProductID = ph.ProductID
WHERE ABS(ph.UnitPrice / NULLIF(ph.PreviousUnitPrice,0) - 1) >= 0.10
ORDER BY ABS((ph.UnitPrice / NULLIF(ph.PreviousUnitPrice,0) - 1) * 100) DESC,
         p.SKU, ph.OrderDate;
