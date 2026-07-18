USE WindowFunctionsTrainingDB;
GO



WITH TotalSalesPerSalePerson as
(
    select
           SalesPersonID,
           SUM(Amount) as TotalSales
    from SalesOrders
    group by  SalesPersonID
)

select 
      SalesPersonID,
      FullName,
      TotalSales,
      Rank() over
      (order by TotalSales desc)
      as SalesRank
from TotalSalesPerSalePerson
join Employees 
on TotalSalesPerSalePerson.SalesPersonID = Employees.EmployeeID
order by TotalSales desc
