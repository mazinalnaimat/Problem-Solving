USE WindowFunctionsTrainingDB;
GO

select
      Dp.DepartmentName,
      Em.FullName,
      Em.Salary,
      AVG(Salary)
      OVER
      (
         PARTITION BY Dp.DepartmentID
      )
      AS AvgSalaryInDepartment
      
from Employees AS Em
join Departments As Dp
ON Em.DepartmentID = Dp.DepartmentID
ORDER BY Dp.DepartmentName, Em.FullName;














