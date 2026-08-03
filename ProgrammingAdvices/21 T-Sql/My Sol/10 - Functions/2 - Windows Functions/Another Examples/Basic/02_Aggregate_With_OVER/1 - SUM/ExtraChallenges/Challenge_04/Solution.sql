/*
Challenge 04: Department salary total beside each employee
Level: Intermediate
*/

USE WindowFunctionsTrainingDB;
GO

SELECT
    e.EmployeeID,
    e.FullName,
    d.DepartmentName,
    e.Salary,
    SUM(e.Salary) OVER
    (
        PARTITION BY e.DepartmentID
    ) AS DepartmentSalaryTotal
FROM dbo.Employees AS e
INNER JOIN dbo.Departments AS d
    ON d.DepartmentID = e.DepartmentID
ORDER BY d.DepartmentName, e.EmployeeID;

