USE WindowFunctionsTrainingDB;
GO

SELECT
    d.DepartmentName,
    e.FullName,
    e.HireDate,
    e.Salary,
    LAG(e.Salary) OVER
    (
        PARTITION BY e.DepartmentID
        ORDER BY e.HireDate, e.EmployeeID
    ) AS PreviousSalaryInDepartment
FROM dbo.Employees e
JOIN dbo.Departments d ON d.DepartmentID = e.DepartmentID
ORDER BY d.DepartmentName, e.HireDate;
