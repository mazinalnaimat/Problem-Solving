USE WindowFunctionsTrainingDB;
GO


select
      Em.FullName AS SalesPerson,
      SO.OrderID,
      SO.OrderDate,
      SO.Amount,
	  STDEVP(SO.Amount)
	  OVER
	  (
		partition by SO.SalesPersonID
		order by OrderDate, OrderID
		rows  between
		unbounded preceding and current row
	  )AS SalesPersonOrderAmountPopStdDevSoFar
from SalesOrders AS SO
join Employees as Em
on SO.SalesPersonID = Em.EmployeeID
ORDER BY Em.FullName, SO.OrderDate, SO.OrderID;

