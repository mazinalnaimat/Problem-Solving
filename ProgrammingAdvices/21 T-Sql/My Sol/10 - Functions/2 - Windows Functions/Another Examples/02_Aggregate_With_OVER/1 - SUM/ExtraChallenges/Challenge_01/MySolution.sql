/*
Challenge 01: Total salary of all employees
Level: Beginner

Write your solution below.
*/

USE WindowFunctionsTrainingDB;
GO


-- Write your query here:

select SUM(Salary)AS TotalSalary
from Employees

