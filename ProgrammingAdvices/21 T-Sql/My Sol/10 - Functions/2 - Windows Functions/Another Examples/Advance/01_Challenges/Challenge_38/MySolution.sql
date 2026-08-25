USE RetailOperations3NFDB;
GO

/*
Challenge 38: Orders Above the Previous Three-Order Average
Difficulty: Medium

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/



/*
select * from Customers
select * from SalesOrders
select * from OrderItems
select * from OrderItems
*/

With OrderTotals AS
(
	select 
		  SO.OrderId,
		  SO.OrderDate,
		  SO.CustomerID,
		  SUM
		  (
			OI.UnitPrice * OI.Quantity * ( 1.0 - OI.DiscountPercent/100.0 )
		  ) - SO.OrderDiscount AS OrderValue
	from SalesOrders AS SO
	join OrderItems AS OI
		on SO.OrderID = OI.OrderID
	where OrderStatusID <> 6
	group by SO.OrderID, SO.OrderDate, SO.OrderDiscount, SO.CustomerID
),
OrderTotalsWithStatics as 
(
	select 
	      OT.*,
	      AVG(OT.OrderValue)
	      OVER
	      (
	      	partition by OT.CustomerId
	      	order by OT.OrderDate, OT.OrderID
	      	rows between 3 preceding and 1 preceding
	      )AS PreviousThreeAverage,
		  COUNT(*) 
	      OVER
          (
	      	partition by OT.CustomerId
	      	order by OT.OrderDate, OT.OrderID
	      	rows between 3 preceding and 1 preceding
          ) AS PreviousOrderCount
	from OrderTotals AS OT 
)

select 
      Cu.CustomerNumber,
	  SO.OrderNumber,
	  OTWS.OrderDate,
	  CAST(OTWS.OrderValue as decimal(12,2)) AS OrderValue,
	  CAST(OTWS.PreviousThreeAverage as decimal(12, 2)) AS PreviousThreeAverage,
	  CAST
	  ( 
	    (OTWS.OrderValue / NULLIF(OTWS.PreviousThreeAverage, 0) - 1)*100.0
		AS decimal(5,2)
	  ) AS PercentAboveAverage
from OrderTotalsWithStatics AS OTWS
join Customers AS Cu
	on OTWS.CustomerID = Cu.CustomerID
join SalesOrders AS SO
	on OTWS.OrderID = SO.OrderID
where OTWS.PreviousOrderCount = 3
	 and OTWS.OrderValue >= OTWS.PreviousThreeAverage * 1.50
order by PercentAboveAverage DESC, Cu.CustomerNumber, OTWS.OrderDate

