USE RetailOperations3NFDB;
GO

;WITH ValidOrderProducts AS
(
    SELECT DISTINCT
        oi.OrderID,
        oi.ProductID
    FROM dbo.OrderItems oi
    JOIN dbo.SalesOrders o ON o.OrderID = oi.OrderID
    WHERE o.OrderStatusID <> 6
),
ProductPairs AS
(
    SELECT
        p1.OrderID,
        p1.ProductID AS ProductID1,
        p2.ProductID AS ProductID2
    FROM ValidOrderProducts p1
    JOIN ValidOrderProducts p2
      ON p2.OrderID = p1.OrderID
     AND p2.ProductID > p1.ProductID
),
PairSupport AS
(
    SELECT
        ProductID1,
        ProductID2,
        COUNT(*) AS OrdersTogether
    FROM ProductPairs
    GROUP BY ProductID1, ProductID2
),
RankedPairs AS
(
    SELECT
        ps.*,
        DENSE_RANK() OVER
        (
            ORDER BY ps.OrdersTogether DESC
        ) AS PairRank
    FROM PairSupport ps
)
SELECT
    p1.SKU AS Product1SKU,
    p2.SKU AS Product2SKU,
    rp.OrdersTogether,
    rp.PairRank
FROM RankedPairs rp
JOIN dbo.Products p1 ON p1.ProductID = rp.ProductID1
JOIN dbo.Products p2 ON p2.ProductID = rp.ProductID2
WHERE rp.PairRank <= 10
ORDER BY rp.PairRank, p1.SKU, p2.SKU;
