USE WindowFunctionsTrainingDB;
GO

SELECT DISTINCT
    d.DepartmentName,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY e.Salary) OVER
    (
        PARTITION BY e.DepartmentID
    ) AS MedianSalary
FROM dbo.Employees e
JOIN dbo.Departments d ON d.DepartmentID = e.DepartmentID
ORDER BY d.DepartmentName;
