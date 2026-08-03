USE WindowFunctionsTrainingDB;
GO

select 
      Em.FullName AS SalesPerson,
      SO.OrderID,
      SO.OrderDate,
      SO.Amount,
	  COUNT(*)
	  OVER
	  (
		partition by SO.SalesPersonID
		order by SO.OrderDate, OrderID
		rows between
		unbounded preceding and current row
	  )AS OrderNumPerSalesPersonSoFar
 from SalesOrders AS SO
join Employees AS Em
On SO.SalesPersonID = Em.EmployeeID
ORDER BY Em.FullName, SO.OrderDate, SO.OrderID;




