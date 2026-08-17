/*
USE RetailOperations3NFDB;
GO
*/

;WITH SupplierMetrics AS
(
    SELECT
        ps.SupplierID,
        COUNT(*) AS ListedProductCount,
        SUM(CASE WHEN CAST(ps.IsPreferred as int) = 1 THEN 1 ELSE 0 END) AS PreferredProductCount
    FROM ProductSuppliers ps
    GROUP BY ps.SupplierID
),
RankedSuppliers AS
(
    SELECT
        sm.*,
        sm.PreferredProductCount * 100.0 / NULLIF(sm.ListedProductCount,0) AS PreferredPercent,
        DENSE_RANK() OVER
        (
            ORDER BY sm.PreferredProductCount * 1.0 / NULLIF(sm.ListedProductCount,0) DESC
        ) AS DependencyRank
    FROM SupplierMetrics sm
)
SELECT
    s.SupplierCode,
    s.SupplierName,
    rs.ListedProductCount,
    rs.PreferredProductCount,
    CAST(rs.PreferredPercent AS decimal(7,2)) AS PreferredPercent,
    rs.DependencyRank
FROM RankedSuppliers rs
JOIN Suppliers s ON s.SupplierID = rs.SupplierID
ORDER BY rs.DependencyRank, s.SupplierCode;
