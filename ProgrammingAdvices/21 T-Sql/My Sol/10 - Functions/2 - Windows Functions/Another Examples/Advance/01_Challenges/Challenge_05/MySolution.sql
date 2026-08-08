USE RetailOperations3NFDB;
GO

/*
Challenge 05: Product Margin Rank inside Brand
Difficulty: Medium

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/



;WITH ProductMargins AS
(
    select
          Pr.BrandID,
          Pr.ProductID,
          Pr.SKU,
          Pr.ProductName,
          (Pr.ListPrice - Pr.StandardCost) * 100.0 / NULLIF(Pr.ListPrice,0) AS GrossMarginPercent
    from Products as Pr
    where Pr.IsActive = 1
),
RankedMargins as
(
     select
        PM.*,
        DENSE_RANK() 
        OVER
        (
            partition by  PM.BrandID
            order by PM.GrossMarginPercent DESC
        ) AS MarginRank
    FROM ProductMargins PM
)

select 
      Br.BrandName,
      RM.SKU,
      RM.ProductName,
      CAST(RM.GrossMarginPercent as decimal(9,2))As GrossMarginPercent,
      RM.MarginRank
from RankedMargins AS RM
join Brands AS Br
    on Rm.BrandID = Br.BrandID
order by Br.BrandName, RM.MarginRank, RM.SKU;







