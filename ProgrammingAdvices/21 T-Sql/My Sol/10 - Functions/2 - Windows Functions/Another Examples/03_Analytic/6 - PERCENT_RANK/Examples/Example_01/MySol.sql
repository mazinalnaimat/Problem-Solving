USE WindowFunctionsTrainingDB;
GO


select 
	  Dp.DepartmentName,
	  Em.FullName,
	  Em.Salary,
	  PERCENT_RANK()
	  OVER
	  (
		partition by Em.DepartmentID
		order by Salary DESC
	  )AS SalaryPerDepartmentPercentRank
from Employees as Em
join Departments as Dp
on Em.DepartmentID = Dp.DepartmentID
order by Dp.DepartmentName, Em.Salary;
