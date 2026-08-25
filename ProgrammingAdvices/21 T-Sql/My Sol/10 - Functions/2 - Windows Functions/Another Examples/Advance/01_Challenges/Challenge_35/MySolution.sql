USE RetailOperations3NFDB;
GO

/*
Challenge 35: Cheapest Supplier Options per Product
Difficulty: Medium

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/

/*
select * from Products;
select * from Suppliers;
select * from ProductSuppliers;
*/

with RankedQoutes as 
(
    select 
          PS.ProductID,
          PS.SupplierID,
          PS.UnitCost,
          PS.LeadTimeDays,
          DENSE_RANK()
          OVER
          (
            partition by PS.ProductID
            order by PS.UnitCost ASC
          )
          AS CostRank
    from ProductSuppliers AS PS
    join Suppliers As Sp
        on PS.SupplierID = Sp.SupplierID
    WHERE Sp.IsActive = 1

)

select 
      Prc.SKU,
      Sp.SupplierCode,
      Sp.SupplierName,
      RQ.UnitCost,
      RQ.LeadTimeDays,
      RQ.CostRank
from RankedQoutes AS RQ
join Suppliers AS Sp
    on RQ.SupplierID = Sp.SupplierID
join Products AS Prc
    on RQ.ProductID = Prc.ProductID
where RQ.CostRank < 4
order by Prc.SKU, RQ.UnitCost, Sp.SupplierCode
