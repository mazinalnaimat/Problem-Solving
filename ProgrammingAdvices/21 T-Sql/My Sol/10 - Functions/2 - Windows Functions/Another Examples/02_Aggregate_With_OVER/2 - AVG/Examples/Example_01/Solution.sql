USE WindowFunctionsTrainingDB;
GO

SELECT
    d.DepartmentName,
    e.FullName,
    e.Salary,
    AVG(e.Salary) OVER
    (
        PARTITION BY e.DepartmentID
    ) AS AverageSalaryInDepartment
FROM dbo.Employees e
JOIN dbo.Departments d ON d.DepartmentID = e.DepartmentID
ORDER BY d.DepartmentName, e.FullName;
