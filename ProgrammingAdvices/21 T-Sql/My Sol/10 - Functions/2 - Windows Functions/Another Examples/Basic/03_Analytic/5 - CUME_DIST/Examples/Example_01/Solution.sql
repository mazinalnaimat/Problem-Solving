USE WindowFunctionsTrainingDB;
GO

SELECT
    d.DepartmentName,
    e.FullName,
    e.Salary,
    CUME_DIST() OVER
    (
        PARTITION BY e.DepartmentID
        ORDER BY e.Salary
    ) AS SalaryCumeDist
FROM dbo.Employees e
JOIN dbo.Departments d ON d.DepartmentID = e.DepartmentID
ORDER BY d.DepartmentName, e.Salary;
