USE WindowFunctionsTrainingDB;
GO

With MinDepartmentSalaries as 
(
	select
		  DepartmentName,
		  EmployeeID,
		  FullName as EmployeeName,
		  Salary,
		  MIN(Salary)
		  OVER
		  (
			partition by Employees.DepartmentID
		  )AS MinDepartmentSalary

	from Employees
	join Departments
	on Employees.DepartmentID = Departments.DepartmentID
)

select * from MinDepartmentSalaries
order by  MinDepartmentSalary 