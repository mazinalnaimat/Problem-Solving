USE RetailOperations3NFDB;
GO

;WITH RankedQuotes AS
(
    SELECT
        ps.ProductID,
        ps.SupplierID,
        ps.UnitCost,
        ps.LeadTimeDays,
        DENSE_RANK() OVER
        (
            PARTITION BY ps.ProductID
            ORDER BY ps.UnitCost
        ) AS CostRank
    FROM dbo.ProductSuppliers ps
    JOIN dbo.Suppliers s ON s.SupplierID = ps.SupplierID
    WHERE s.IsActive = 1
)
SELECT
    p.SKU,
    s.SupplierCode,
    s.SupplierName,
    rq.UnitCost,
    rq.LeadTimeDays,
    rq.CostRank
FROM RankedQuotes rq
JOIN dbo.Products p ON p.ProductID = rq.ProductID
JOIN dbo.Suppliers s ON s.SupplierID = rq.SupplierID
WHERE rq.CostRank <= 3
ORDER BY p.SKU, rq.CostRank, s.SupplierCode;
