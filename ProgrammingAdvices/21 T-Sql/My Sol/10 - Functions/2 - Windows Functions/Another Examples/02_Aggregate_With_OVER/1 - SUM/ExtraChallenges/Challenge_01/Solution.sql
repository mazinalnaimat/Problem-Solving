/*
Challenge 01: Total salary of all employees
Level: Beginner
*/

USE WindowFunctionsTrainingDB;
GO

SELECT
    SUM(Salary) AS TotalSalary
FROM dbo.Employees;

