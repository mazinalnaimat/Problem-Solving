/*
Challenge 07: Running sales total for each salesperson
Level: Intermediate+

Write your solution below.
*/

USE WindowFunctionsTrainingDB;
GO


-- Write your query here:

SELECT 
	  SO.SalesPersonID,
	  Em.FullName,
	  SO.OrderID,
	  SO.OrderDate,
	  SO.Amount,
	  SUM(SO.Amount)
	  OVER
	  (
		partition by SO.SalesPersonID
		order by OrderID, OrderDate
		ROWS BETWEEN
		UNBOUNDED PRECEDING AND CURRENT ROW
	  )
	  AS SalesPersonRunntingTotal

FROM SalesOrders AS SO
JOIN Employees AS Em
ON SO.SalesPersonID = Em.EmployeeID
ORDER BY SO.SalesPersonID, SO.OrderDate, SO.OrderID

