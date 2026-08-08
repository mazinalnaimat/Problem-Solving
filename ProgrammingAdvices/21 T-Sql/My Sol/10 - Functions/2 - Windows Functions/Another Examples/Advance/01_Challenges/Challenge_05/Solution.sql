USE RetailOperations3NFDB;
GO

;WITH ProductMargins AS
(
    SELECT
        p.BrandID,
        p.ProductID,
        p.SKU,
        p.ProductName,
        (p.ListPrice - p.StandardCost) * 100.0 / NULLIF(p.ListPrice,0) AS GrossMarginPercent
    FROM dbo.Products p
    WHERE p.IsActive = 1
),
RankedMargins AS
(
    SELECT
        pm.*,
        DENSE_RANK() OVER
        (
            PARTITION BY pm.BrandID
            ORDER BY pm.GrossMarginPercent DESC
        ) AS MarginRank
    FROM ProductMargins pm
)
SELECT
    b.BrandName,
    rm.SKU,
    rm.ProductName,
    CAST(rm.GrossMarginPercent AS decimal(9,2)) AS GrossMarginPercent,
    rm.MarginRank
FROM RankedMargins rm
JOIN dbo.Brands b ON b.BrandID = rm.BrandID
ORDER BY b.BrandName, rm.MarginRank, rm.SKU;
