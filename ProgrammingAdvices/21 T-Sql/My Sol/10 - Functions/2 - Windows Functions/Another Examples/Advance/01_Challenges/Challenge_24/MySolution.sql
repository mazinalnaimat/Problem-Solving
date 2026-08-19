/*
USE RetailOperations3NFDB;
GO
*/

/*
Challenge 24: Monthly Category Revenue Share
Difficulty: Medium

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/


/*
select * from Products
*/


with TotalRevenuesPerCategory as 
(
  select
        Prc.CategoryId,
        MAKE_DATE(Extract (year from SO.OrderDate)::int, Extract(MONTH from SO.OrderDate)::int, 1)AS MonthStart,
        SUM 
        (
          OI.UnitPrice * OI.Quantity * (1 - OI.DiscountPercent/100.0)
        ) - SO.OrderDiscount AS RevenueValue
        
  from SalesOrders AS SO
  join OrderItems AS OI
      on SO.OrderId = OI.orderid
  join Products As Prc
      on OI.ProductId = Prc.ProductId
  where SO.OrderStatusID <>6
  group by Prc.CategoryId, SO.OrderDate, SO.OrderDiscount
),
MonthlyRevenuesPerCategory AS
(

  select
        TRPC.CategoryId,
        TRPC.MonthStart,
        SUM
        (
          TRPC.RevenueValue
        ) AS MonthlyRevenue
  from TotalRevenuesPerCategory AS TRPC
  group by  TRPC.MonthStart,TRPC.CategoryId

)
,
MonthlyRevenues AS
(
  Select distinct
        MRPC.MonthStart,
        SUM(MRPC.MonthlyRevenue)
        OVER
        (
          partition by MRPC.MonthStart
        ) AS MonthlyRevenue

  from MonthlyRevenuesPerCategory AS MRPC

)


Select
      MRPC.MonthStart,
      Cg.CategoryName,
      CAST(MRPC.MonthlyRevenue as decimal (15,2)) AS CategoryRevenue,
      CAST(MR.MonthlyRevenue   as decimal (15,2))AS MonthlyRevenue,
      CAST(MRPC.MonthlyRevenue * 100.0 / NULLIF(MR.MonthlyRevenue,0) as decimal (15,2)) AS RevenueSharePercent
from MonthlyRevenuesPerCategory AS MRPC
join MonthlyRevenues AS MR 
  on MRPC.MonthStart = MR.MonthStart
join Categories AS Cg 
  on MRPC.CategoryId = Cg.CategoryId
  
order by MRPC.MonthStart,
CAST(MRPC.MonthlyRevenue / MR.MonthlyRevenue as decimal (15,2))  DESC  





