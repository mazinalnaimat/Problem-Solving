USE WindowFunctionsTrainingDB;
GO

select 
      Dp.DepartmentName,
      Em.FullName,
      Em.Salary,
	  COUNT(*)
	  OVER
	  (
		partition by Em.DepartmentID
	  )EmployeeCountInDepartment
from Employees AS Em
join Departments As Dp
ON Em.DepartmentID = Dp.DepartmentID
ORDER BY Dp.DepartmentName, Em.FullName;
