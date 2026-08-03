USE WindowFunctionsTrainingDB;
GO

select
      Dp.DepartmentName,
      Em.FullName,
      Em.Salary,
      VAR(Em.Salary)
      OVER
      (
        partition by Dp.DepartmentID
      )AS SalarySamVarPerDepartment
     
from Departments AS Dp
join Employees as Em
on Dp.DepartmentID = Em.DepartmentID
ORDER BY Dp.DepartmentName, Em.FullName;

