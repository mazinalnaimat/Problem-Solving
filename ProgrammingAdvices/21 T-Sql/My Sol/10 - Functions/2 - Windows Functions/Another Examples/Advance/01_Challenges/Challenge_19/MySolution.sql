/*
USE RetailOperations3NFDB;
GO
*/
/*
Challenge 19: Preferred-Supplier Dependency Rank
Difficulty: Medium

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/

;WITH SupplierMetrics AS
(
    select
          PS.SupplierID,
          COUNT(*) AS ListedProductCount,
          SUM(CASE WHEN CAST(PS.IsPreferred as int) = 1 THEN 1 ELSE 0 END) AS PreferredProductCount
    from ProductSuppliers AS PS
    group by PS.SupplierID
),
RankedSuppliers AS
(
    select
        SM.*,
        SM.PreferredProductCount * 100.0 / NULLIF(SM.ListedProductCount,0) AS PreferredPercent,
        DENSE_RANK() 
        OVER
        (
            order by SM.PreferredProductCount * 1.0 / NULLIF(SM.ListedProductCount,0) DESC
        ) AS DependencyRank
    from SupplierMetrics AS SM
)
select
    Su.SupplierCode,
    Su.SupplierName,
    RS.ListedProductCount,
    RS.PreferredProductCount,
    CAST(RS.PreferredPercent AS decimal(7,2)) AS PreferredPercent,
    RS.DependencyRank
from RankedSuppliers AS RS
join Suppliers AS Su 
    on Su.SupplierID = RS.SupplierID
order by RS.DependencyRank, Su.SupplierCode;

