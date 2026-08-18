/*
USE RetailOperations3NFDB;
GO
*/
;WITH ProductSales AS
(
    SELECT
        oi.ProductID,
        SUM(oi.Quantity) AS SoldQuantity
    FROM OrderItems oi
    JOIN SalesOrders o ON o.OrderID = oi.OrderID
    WHERE o.OrderStatusID <> 6
    GROUP BY oi.ProductID
),
ProductReturns AS
(
    SELECT
        oi.ProductID,
        SUM(ri.QuantityReturned) AS ReturnedQuantity
    FROM ReturnItems ri
    JOIN Returns r ON r.ReturnID = ri.ReturnID
    JOIN ReturnStatuses rs ON rs.ReturnStatusID = r.ReturnStatusID
    JOIN OrderItems oi ON oi.OrderItemID = ri.OrderItemID
    WHERE rs.StatusName = N'Completed'
    GROUP BY oi.ProductID
),
ReturnMetrics AS
(
    SELECT
        p.CategoryID,
        p.ProductID,
        p.SKU,
        ps.SoldQuantity,
        COALESCE(pr.ReturnedQuantity,0) AS ReturnedQuantity,
        COALESCE(pr.ReturnedQuantity,0) * 100.0 / NULLIF(ps.SoldQuantity,0)
            AS ReturnRatePercent
    FROM Products p
    JOIN ProductSales ps ON ps.ProductID = p.ProductID
    LEFT JOIN ProductReturns pr ON pr.ProductID = p.ProductID
    WHERE ps.SoldQuantity >= 20
),
RankedReturns AS
(
    SELECT
        rm.*,
        PERCENT_RANK() OVER
        (
            PARTITION BY rm.CategoryID
            ORDER BY rm.ReturnRatePercent
        ) AS CategoryPercentRank
    FROM ReturnMetrics rm
)
SELECT
    c.CategoryName,
    rr.SKU,
    rr.SoldQuantity,
    rr.ReturnedQuantity,
    CAST(rr.ReturnRatePercent AS decimal(7,2)) AS ReturnRatePercent,
    CAST(rr.CategoryPercentRank AS decimal(7,4)) AS CategoryPercentRank
FROM RankedReturns rr
JOIN Categories c ON c.CategoryID = rr.CategoryID
ORDER BY c.CategoryName, rr.CategoryPercentRank DESC, rr.SKU;
