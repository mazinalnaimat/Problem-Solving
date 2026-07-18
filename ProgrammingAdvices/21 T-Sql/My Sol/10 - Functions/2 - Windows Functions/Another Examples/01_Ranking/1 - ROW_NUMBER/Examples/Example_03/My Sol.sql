USE WindowFunctionsTrainingDB;
GO


With PaginationEmployees as
(
    select EmployeeID, FullName, Salary,
    Row_Number() over (order by EmployeeID) as RowNum
    from Employees
)
select * from PaginationEmployees
where RowNum between 6 and 10
order by RowNum


