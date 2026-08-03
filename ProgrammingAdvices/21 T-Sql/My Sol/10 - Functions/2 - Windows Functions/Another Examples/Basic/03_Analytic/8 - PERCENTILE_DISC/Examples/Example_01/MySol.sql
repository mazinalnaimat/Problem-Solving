USE WindowFunctionsTrainingDB;
GO


select distinct
      Dp.DepartmentName,
	  PERCENTILE_DISC(0.5)
	  within group (order by Salary)
	  over
	  (
		partition by Dp.DepartmentID 
	  )AS   DiscreteMedianSalary
from Departments as Dp
join Employees as Em
on Dp.DepartmentID = Em.DepartmentID
ORDER BY Dp.DepartmentName;


