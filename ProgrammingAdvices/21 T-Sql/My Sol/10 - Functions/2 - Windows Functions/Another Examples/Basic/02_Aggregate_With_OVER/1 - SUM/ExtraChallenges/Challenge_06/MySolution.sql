/*
Challenge 06: Running total of all sales
Level: Intermediate

Write your solution below.
*/

USE WindowFunctionsTrainingDB;
GO


-- Write your query here:


select 
	  OrderID,
	  OrderDate,
	  CustomerName,
	  Amount,
	  SUM(Amount)
	  OVER
	  (
		order by OrderID, OrderDate
		ROWS BETWEEN
		UNBOUNDED PRECEDING AND CURRENT ROW
	  )
	  AS RunningTotalAmount
FROM SalesOrders;
