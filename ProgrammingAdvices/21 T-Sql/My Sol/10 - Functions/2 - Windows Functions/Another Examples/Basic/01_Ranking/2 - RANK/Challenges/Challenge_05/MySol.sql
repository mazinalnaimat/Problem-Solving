USE WindowFunctionsTrainingDB;
GO



with SalesPersonTotalSales AS
(
    select 
          FullName,
          SUM(Amount) AS TotalSales
    from SalesOrders
    join Employees
    on SalesOrders.SalesPersonID = Employees.EmployeeID
    group by FullName
)

Select 
        *,
        RANK() OVER
        (
        order by TotalSales desc
        )TotalSalesRank
from SalesPersonTotalSales;











