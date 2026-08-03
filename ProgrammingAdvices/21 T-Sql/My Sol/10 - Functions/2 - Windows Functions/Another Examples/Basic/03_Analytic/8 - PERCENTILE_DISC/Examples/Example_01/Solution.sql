USE WindowFunctionsTrainingDB;
GO

SELECT DISTINCT
    d.DepartmentName,
    PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY e.Salary) OVER
    (
        PARTITION BY e.DepartmentID
    ) AS DiscreteMedianSalary
FROM dbo.Employees e
JOIN dbo.Departments d ON d.DepartmentID = e.DepartmentID
ORDER BY d.DepartmentName;
