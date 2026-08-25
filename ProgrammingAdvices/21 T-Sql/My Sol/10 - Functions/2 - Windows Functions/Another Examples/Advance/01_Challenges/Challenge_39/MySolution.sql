USE RetailOperations3NFDB;
GO

/*
Challenge 39: First and Second Order Comparison
Difficulty: Medium

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/
with OrderTotals as
(
	select
		  SO.CustomerID,
		  SO.OrderID,
		  SO.OrderDate,
		  SUM
		  (
			OI.Quantity * OI.UnitPrice * (1.0 - OI.DiscountPercent/100.0)
		  ) - SO.OrderDiscount AS OrderValue 
	from SalesOrders AS SO
	join OrderItems AS OI
		 on SO.OrderId = OI.OrderId
	where SO.OrderStatusID <> 6
	group by SO.OrderID, SO.OrderDate, SO.OrderDiscount, SO.CustomerID
),
OrderSequence AS
(
    select
          OT.*,
          ROW_NUMBER()
          OVER
          (
              partition by OT.CustomerID
              order by OT.OrderDate, OT.OrderID
          ) AS OrderSequence,
          LEAD(OT.OrderDate)
          OVER
          (
              partition by OT.CustomerID
              order by OT.OrderDate, OT.OrderID
          ) AS SecondOrderDate,
          LEAD(OT.OrderValue)
          OVER
          (
              partition by OT.CustomerID
              order by OT.OrderDate, OT.OrderID
          ) AS SecondOrderValue
    from OrderTotals AS OT
)
select
      Cu.CustomerNumber,
      OS.OrderDate AS FirstOrderDate,
      CAST(OS.OrderValue AS decimal(14,2)) AS FirstOrderValue,
      OS.SecondOrderDate,
      CAST(OS.SecondOrderValue AS decimal(14,2)) AS SecondOrderValue,
      DATEDIFF(DAY, OS.OrderDate, OS.SecondOrderDate) AS DaysToSecondOrder,
      CAST(OS.SecondOrderValue - OS.OrderValue AS decimal(14,2)) AS ValueChange
from OrderSequence AS OS
join Customers AS Cu 
    on Cu.CustomerID = OS.CustomerID
where OS.OrderSequence = 1
   and OS.SecondOrderDate is not null
order by DaysToSecondOrder, Cu.CustomerNumber;



