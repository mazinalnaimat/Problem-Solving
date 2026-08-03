USE WindowFunctionsTrainingDB;
GO

select
      Dp.DepartmentName,
      Em.FullName,
      Em.Salary,
      STDEV(Em.Salary)
      OVER
      (
        partition by Em.DepartmentID
      )AS SampleSalaryStdDevInDepartment
from Employees AS Em
join Departments AS Dp
on Em.DepartmentID = Dp.DepartmentID
ORDER BY Dp.DepartmentName, Em.FullName;

