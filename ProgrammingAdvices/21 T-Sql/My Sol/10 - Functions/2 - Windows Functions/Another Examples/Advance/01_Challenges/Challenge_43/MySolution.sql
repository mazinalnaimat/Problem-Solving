USE RetailOperations3NFDB;
GO

/*
Challenge 43: Products Forming the First 80 Percent of Category Revenue
Difficulty: Hard

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/



/*
select * from SalesOrders
select * from Products
*/
with ProductRevenue as
(
	select 
		  Prc.CategoryID,
		  Prc.ProductID,
		  Prc.SKU,
		  SUM
		  (
			OI.UnitPrice * OI.Quantity * (1.0 - OI.DiscountPercent / 100.0)
		  )  AS ProductRevenue
	from SalesOrders AS SO
	join OrderItems AS OI
		on SO.OrderID = OI.OrderID
	join Products AS Prc
		on OI.ProductID = Prc.ProductID
	where SO.OrderStatusID <> 6
	group by Prc.CategoryID, Prc.ProductID, Prc.SKU

),
RevenueCurve AS
(
    select
          PR.*,
          ROW_NUMBER()
          over
          (
              partition by PR.CategoryID
              order by PR.ProductRevenue DESC, PR.ProductID
          ) AS RevenuePosition,
          SUM(pr.ProductRevenue)
          OVER
          (
              partition by PR.CategoryID
              order by PR.ProductRevenue DESC, PR.ProductID
              rows between unbounded preceding and current row
          ) AS CumulativeRevenue,
          SUM(pr.ProductRevenue)
          OVER
          (
              partition by PR.CategoryID
          ) AS CategoryRevenue
    from ProductRevenue PR
),
ThresholdLogic AS
(
    SELECT
        rc.*,
        (rc.CumulativeRevenue - rc.ProductRevenue) * 100.0
            / NULLIF(rc.CategoryRevenue,0) AS PreviousCumulativePercent
    FROM RevenueCurve rc
)
select
      Cg.CategoryName,
      TL.SKU,
      CAST(tl.ProductRevenue AS decimal(14,2)) AS ProductRevenue,
      CAST(tl.CumulativeRevenue * 100.0 / NULLIF(tl.CategoryRevenue,0) AS decimal(7,2))
          AS CumulativeRevenuePercent,
      TL.RevenuePosition
from ThresholdLogic AS TL
join Categories AS Cg 
    on Cg.CategoryID = TL.CategoryID
where TL.PreviousCumulativePercent < 80
order by Cg.CategoryName, TL.RevenuePosition, TL.SKU;





