USE WindowFunctionsTrainingDB;
GO



select 
      DepartmentName,
      FullName,
      Salary,
      DENSE_RANK() OVER
      (
        partition by Employees.DepartmentID
        ORDER BY Salary desc
      )
      AS DenseSalaryRank
from Employees
join Departments
on Employees.DepartmentID = Departments.DepartmentID
order by DepartmentName