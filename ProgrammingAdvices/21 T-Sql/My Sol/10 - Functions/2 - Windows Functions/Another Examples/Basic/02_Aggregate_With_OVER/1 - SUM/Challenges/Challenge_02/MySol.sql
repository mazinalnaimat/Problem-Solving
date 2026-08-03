USE WindowFunctionsTrainingDB;
GO


select
      Em.FullName AS SalePerson,
      SO.OrderID,
      SO.OrderDate,
      SO.Amount,
      SUM(Amount) OVER
      (
        partition by Em.EmployeeID
        order by SO.OrderID
                ROWS BETWEEN unbounded PRECEDING
                 AND current ROW
      )
      AS RunningSalesForPerson
      
from SalesOrders AS SO
join Employees AS Em
on SO.SalesPersonID = Em.EmployeeID
ORDER BY Em.FullName, SO.OrderDate, SO.OrderID;

