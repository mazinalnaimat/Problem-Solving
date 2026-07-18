/*
Challenge 04: Department salary total beside each employee
Level: Intermediate

Write your solution below.
*/

USE WindowFunctionsTrainingDB;
GO


-- Write your query here:

select 
		Dp.DepartmentName,
		Em.FullName,
		Em.Salary,
		SUM(Em.Salary)
		OVER
		(
			partition by Dp.DepartmentID
		) 
		AS DepartmentTotalSalary

from Employees As Em
join Departments As Dp
On Em.DepartmentID = Dp.DepartmentID

