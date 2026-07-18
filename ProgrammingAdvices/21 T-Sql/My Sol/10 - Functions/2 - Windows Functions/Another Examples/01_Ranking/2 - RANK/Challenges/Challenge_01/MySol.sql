USE WindowFunctionsTrainingDB;
GO




Select
    DepartmentName,
    FullName,
    Salary,
    Rank() over
    (
       partition by Employees.DepartmentID
       order by Salary desc
    ) as SalaryRank
from Employees
join Departments
on Employees.DepartmentID = Departments.DepartmentID
ORDER BY DepartmentName, SalaryRank;





