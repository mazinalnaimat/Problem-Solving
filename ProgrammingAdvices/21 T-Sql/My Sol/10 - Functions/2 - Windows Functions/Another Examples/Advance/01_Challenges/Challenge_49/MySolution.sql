USE RetailOperations3NFDB;
GO

/*
Challenge 49: Customer First and Latest Order Values
Difficulty: Medium

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/



;WITH OrderTotals AS
(
    select
          SO.OrderID,
          SO.CustomerID,
          SO.OrderDate,
          SUM(oi.Quantity * OI.UnitPrice * (1 - OI.DiscountPercent / 100.0))
              - SO.OrderDiscount AS OrderValue
    from SalesOrders AS SO
    join OrderItems AS OI 
        on OI.OrderID = SO.OrderID
    where SO.OrderStatusID <> 6
    group by SO.OrderID, SO.CustomerID, SO.OrderDate, SO.OrderDiscount
),
BoundaryValues AS
(
    select
          OT.CustomerID,
          FIRST_VALUE(ot.OrderDate) 
          OVER
          (
              partition by OT.CustomerID
              order by OT.OrderDate, OT.OrderID
              rows between unbounded preceding and unbounded following
          ) AS FirstOrderDate,
          FIRST_VALUE(ot.OrderValue) 
          OVER
          (
              partition by OT.CustomerID
              order by OT.OrderDate, OT.OrderID
              rows between unbounded preceding and unbounded following
          ) AS FirstOrderValue,
          LAST_VALUE(ot.OrderDate) 
          OVER
          (
              partition by OT.CustomerID
              order by OT.OrderDate, OT.OrderID
              rows between unbounded preceding and unbounded following
          ) AS LatestOrderDate,
          LAST_VALUE(ot.OrderValue) 
          OVER
          (
              partition by OT.CustomerID
              order by OT.OrderDate, OT.OrderID
              rows between unbounded preceding and unbounded following
          ) AS LatestOrderValue
    FROM OrderTotals AS OT
)
select distinct
      Cu.CustomerNumber,
      BV.FirstOrderDate,
      CAST(bv.FirstOrderValue AS decimal(14,2)) AS FirstOrderValue,
      BV.LatestOrderDate,
      CAST(bv.LatestOrderValue AS decimal(14,2)) AS LatestOrderValue,
      CAST(bv.LatestOrderValue - BV.FirstOrderValue AS decimal(14,2)) AS ValueChange
from BoundaryValues AS BV
join Customers AS Cu 
    on Cu.CustomerID = BV.CustomerID
order by Cu.CustomerNumber;












