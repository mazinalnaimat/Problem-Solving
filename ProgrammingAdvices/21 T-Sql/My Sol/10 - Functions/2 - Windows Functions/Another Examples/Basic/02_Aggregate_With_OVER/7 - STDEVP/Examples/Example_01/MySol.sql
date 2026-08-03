USE WindowFunctionsTrainingDB;
GO

select
      Dp.DepartmentName,
      Em.FullName,
      Em.Salary,
	  STDEVP(Em.Salary)
	  OVER
	  (
		partition by Em.DepartmentID
	  ) AS DepartmentSalaryPopulationStdDev
from Employees as Em
join Departments as Dp
on Em.DepartmentID = Dp.DepartmentID
order by Dp.DepartmentName, Em.FullName;
