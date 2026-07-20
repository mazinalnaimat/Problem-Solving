USE WindowFunctionsTrainingDB;
GO

select
      Em.FullName AS SalesPerson,
      SO.OrderID,
      SO.OrderDate,
      SO.Amount,
	  STDEV(SO.Amount)
	  OVER
	  (
		partition by SO.SalesPersonID
		order by OrderDate, OrderID
		rows between 
		unbounded preceding and current row
	  )AS SampleOrderStdDevSoFar
	  
from SalesOrders AS SO
join Employees AS Em
on SO.SalesPersonID = Em.EmployeeID
ORDER BY Em.FullName, SO.OrderDate, SO.OrderID;
