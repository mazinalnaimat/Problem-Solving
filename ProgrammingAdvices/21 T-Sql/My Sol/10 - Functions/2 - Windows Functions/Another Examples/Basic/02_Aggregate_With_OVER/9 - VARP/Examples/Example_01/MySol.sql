USE WindowFunctionsTrainingDB;
GO

select 
     Dp.DepartmentName,
     Em.FullName,
     Em.Salary,
      VARP(Em.Salary)
      OVER
      (
        partition by Em.DepartmentId
      )As SalaryPerDeptPopVar
from Employees AS Em
join Departments AS Dp
on Em.DepartmentID = Dp.DepartmentID
order by Dp.DepartmentName, Em.FullName;

