USE WindowFunctionsTrainingDB;
GO


select
       Dp.DepartmentName,
       FullName,
       Salary,
       SUM(Salary)OVER
       (
        partition by Dp.DepartmentID
       )
       AS TotalSalayInDepartment   
from Employees as Em
join Departments As Dp
on Em.DepartmentID = Dp.DepartmentID
ORDER BY Dp.DepartmentName, Em.FullName;

