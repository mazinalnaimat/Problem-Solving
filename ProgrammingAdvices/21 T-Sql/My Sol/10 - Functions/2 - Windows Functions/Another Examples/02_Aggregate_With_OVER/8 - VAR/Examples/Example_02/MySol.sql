USE WindowFunctionsTrainingDB;
GO


select 
	  Em.FullName AS SalesPerson,
	  SO.OrderID,
	  SO.OrderDate,
	  SO.Amount,
	  VAR(SO.Amount)
	  OVER
	  (
		partition by SO.SalesPersonID 
		order by SO.OrderDate, SO.OrderID
	  ) AS OrderAmountPerSalesPersonSamVarSoFar
from SalesOrders AS SO
join Employees AS Em
on SO.SalesPersonID = Em.EmployeeID
ORDER BY EM.FullName, SO.OrderDate, SO.OrderID;



