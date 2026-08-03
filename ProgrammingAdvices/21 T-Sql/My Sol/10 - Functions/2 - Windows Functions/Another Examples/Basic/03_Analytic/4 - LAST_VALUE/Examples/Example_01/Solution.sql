USE WindowFunctionsTrainingDB;
GO

SELECT
    d.DepartmentName,
    e.FullName,
    e.HireDate,
    e.Salary,
    LAST_VALUE(e.Salary) OVER
    (
        PARTITION BY e.DepartmentID
        ORDER BY e.HireDate, e.EmployeeID
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS LastHiredSalaryInDepartment
FROM dbo.Employees e
JOIN dbo.Departments d ON d.DepartmentID = e.DepartmentID
ORDER BY d.DepartmentName, e.HireDate;
