USE WindowFunctionsTrainingDB;
GO




select distinct
      Dp.DepartmentName,
	  PERCENTILE_CONT(0.5)
	  within group (order by Salary)
	  over
	  (
		partition by Dp.DepartmentID 
	  )AS   MedianSalary
from Departments as Dp
join Employees as Em
on Dp.DepartmentID = Em.DepartmentID
ORDER BY Dp.DepartmentName;


