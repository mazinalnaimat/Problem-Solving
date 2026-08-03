USE WindowFunctionsTrainingDB;
GO


select
      Dp.DepartmentName,
      Em.FullName,
      Em.HireDate,
      Em.Salary,
	  LAST_VALUE(Em.Salary)
	  OVER
	  (
		partition by Em.DepartmentID
		order by Em.HireDate, Em.EmployeeID
		rows between 
		unbounded preceding and unbounded following
	  )AS LastHiredSalaryInDepartment
from Employees AS Em
join Departments AS Dp
on Em.DepartmentID  = Dp.DepartmentID
order by Dp.DepartmentName, Em.HireDate;

