USE WindowFunctionsTrainingDB;
GO

SELECT
    d.DepartmentName,
    e.FullName,
    e.Salary,
    VARP(e.Salary) OVER
    (
        PARTITION BY e.DepartmentID
    ) AS PopulationSalaryVarianceInDepartment
FROM dbo.Employees e
JOIN dbo.Departments d ON d.DepartmentID = e.DepartmentID
ORDER BY d.DepartmentName, e.FullName;
