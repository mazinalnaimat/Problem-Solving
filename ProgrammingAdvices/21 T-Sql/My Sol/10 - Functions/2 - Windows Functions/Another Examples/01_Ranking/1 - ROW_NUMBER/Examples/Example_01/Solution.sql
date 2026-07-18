USE WindowFunctionsTrainingDB;
GO

SELECT
    d.DepartmentName,
    e.FullName,
    e.Salary,
    ROW_NUMBER() OVER
    (
        PARTITION BY e.DepartmentID
        ORDER BY e.Salary DESC, e.EmployeeID
    ) AS RowNumberInDepartment
FROM dbo.Employees e
JOIN dbo.Departments d ON d.DepartmentID = e.DepartmentID
ORDER BY d.DepartmentName, RowNumberInDepartment;
