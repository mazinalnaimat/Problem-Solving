USE WindowFunctionsTrainingDB;
GO

select
      Dp.DepartmentName,
      Em.FullName,
      Em.Salary,
      MAX(Em.Salary)
      OVER
      (
        partition by Em.DepartmentID
      )AS MaxSalaryPerDepartment

from Employees As Em
join Departments AS Dp
on Em.DepartmentID = Dp.DepartmentID
ORDER BY Dp.DepartmentName, Em.FullName;
