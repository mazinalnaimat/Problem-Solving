/*
USE RetailOperations3NFDB;
GO
*/
/*
Challenge 23: Product Return-Rate Rank
Difficulty: Hard

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/


;WITH ProductSales AS
(
    select
          OI.ProductID,
          SUM(OI.Quantity) AS SoldQuantity
    from OrderItems AS OI
    join SalesOrders AS SO 
        on SO.OrderID = OI.OrderID
    where SO.OrderStatusID <> 6
    group by OI.ProductID
),
ProductReturns AS
(
    select
          OI.ProductID,
          SUM(ri.QuantityReturned) AS ReturnedQuantity
    from ReturnItems AS RI
    join Returns AS Re 
        on Re.ReturnID = RI.ReturnID
    join ReturnStatuses AS RS 
        on RS.ReturnStatusID = Re.ReturnStatusID
    join OrderItems AS OI 
        on OI.OrderItemID = RI.OrderItemID
    where RS.StatusName = N'Completed'
    group by OI.ProductID
),
ReturnMetrics AS
(
    select
        Prc.CategoryID,
        Prc.ProductID,
        Prc.SKU,
        PS.SoldQuantity,
        COALESCE(PR.ReturnedQuantity,0) AS ReturnedQuantity,
        COALESCE(PR.ReturnedQuantity,0) * 100.0 / NULLIF(PS.SoldQuantity,0)
            AS ReturnRatePercent
    from Products AS Prc
    join ProductSales AS PS 
        on PS.ProductID = Prc.ProductID
    LEFT join ProductReturns AS PR 
        on PR.ProductID = Prc.ProductID
    where PS.SoldQuantity >= 20
),
RankedReturns AS
(
    select
          RM.*,
          PERCENT_RANK() 
          OVER
          (
              partition by  RM.CategoryID
              order by RM.ReturnRatePercent
          ) AS CategoryPercentRank
    from ReturnMetrics AS RM
)
select
      Cg.CategoryName,
      RR.SKU,
      RR.SoldQuantity,
      RR.ReturnedQuantity,
      CAST(rr.ReturnRatePercent AS decimal(7,2)) AS ReturnRatePercent,
      CAST(rr.CategoryPercentRank AS decimal(7,4)) AS CategoryPercentRank
from RankedReturns AS RR
join Categories AS Cg 
    on  Cg.CategoryID = RR.CategoryID
order by  Cg.CategoryName, RR.CategoryPercentRank DESC, RR.SKU;