USE WindowFunctionsTrainingDB;
GO

SELECT
    d.DepartmentName,
    e.FullName,
    e.Salary,
    STDEVP(e.Salary) OVER
    (
        PARTITION BY e.DepartmentID
    ) AS PopulationSalaryStdDevInDepartment
FROM dbo.Employees e
JOIN dbo.Departments d ON d.DepartmentID = e.DepartmentID
ORDER BY d.DepartmentName, e.FullName;
