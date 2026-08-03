USE WindowFunctionsTrainingDB;
GO



select
      Em.FullName AS SalesPerson,
      SO.OrderID,
      SO.OrderDate,
      SO.Amount,
	  VARP(SO.Amount)
	  OVER
	  (
		partition by SO.SalesPersonID
		order by SO.OrderDate, SO.OrderID
		rows between
		unbounded preceding and current row
	  )AS RunngingOrderAmountPerSalesPersonPopVar
from SalesOrders AS SO
join Employees AS Em
on SO.SalesPersonID = Em.EmployeeID
order by Em.FullName, SO.OrderDate, SO.OrderID;