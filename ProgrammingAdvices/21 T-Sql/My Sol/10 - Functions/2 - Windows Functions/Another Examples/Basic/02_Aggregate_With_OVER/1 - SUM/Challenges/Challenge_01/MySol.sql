USE WindowFunctionsTrainingDB;
GO

select 
      Dp.DepartmentName,
      Em.FullName,
      Em.Salary,
      SUM(Em.Salary) OVER
      (
        partition by Dp.DepartmentID
      )
      AS TotalSalaryInDepartment

from Employees AS Em
join Departments As Dp
on Em.DepartmentID = Dp.DepartmentID
ORDER BY Dp.DepartmentName, Em.FullName;


























