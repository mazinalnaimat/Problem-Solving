USE RetailOperations3NFDB;
GO

/*
Challenge 06: Most Common Product Pairs
Difficulty: Hard

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/


;WITH ValidOrderProducts AS
(
    select distinct
        OI.OrderID,
        OI.ProductID
    from OrderItems AS OI
    join SalesOrders SO 
        on SO.OrderID = OI.OrderID
    where SO.OrderStatusID <> 6
),
ProductPairs AS 
(
     select 
          VOP1.OrderID,
          VOP1.ProductID AS ProductID1,
          VOP2.ProductID AS ProductID2
     from ValidOrderProducts AS VOP1
     join ValidOrderProducts AS VOP2
     on VOP1.OrderID = VOP2.OrderID
     and VOP2.ProductID > VOP1.ProductID
),
PairSupport AS
(
    select
        ProductID1,
        ProductID2,
        COUNT(*) AS OrdersTogether
    from ProductPairs
    group by ProductID1, ProductID2
),
RankedPairs AS
(
    select
        PS.*,
        DENSE_RANK() 
        OVER
        (
            ORDER BY ps.OrdersTogether DESC
        ) AS PairRank
    from PairSupport AS PS
)
select
    Pr1.SKU AS Product1SKU,
    Pr2.SKU AS Product2SKU,
    RP.OrdersTogether,
    RP.PairRank
from RankedPairs RP
join Products Pr1 
    on Pr1.ProductID = RP.ProductID1
join Products Pr2 
    on Pr2.ProductID = RP.ProductID2
where RP.PairRank <= 10
order by RP.PairRank, Pr1.SKU, Pr2.SKU;

