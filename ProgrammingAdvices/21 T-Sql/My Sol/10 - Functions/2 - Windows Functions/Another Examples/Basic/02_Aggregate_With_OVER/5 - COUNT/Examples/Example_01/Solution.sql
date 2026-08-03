USE WindowFunctionsTrainingDB;
GO

SELECT
    d.DepartmentName,
    e.FullName,
    e.Salary,
    COUNT(*) OVER
    (
        PARTITION BY e.DepartmentID
    ) AS EmployeeCountInDepartment
FROM dbo.Employees e
JOIN dbo.Departments d ON d.DepartmentID = e.DepartmentID
ORDER BY d.DepartmentName, e.FullName;
