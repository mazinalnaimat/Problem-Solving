USE WindowFunctionsTrainingDB;
GO

WITH x AS
(
    SELECT
        d.DepartmentName,
        e.FullName,
        e.Salary,
        ROW_NUMBER() OVER
        (
            PARTITION BY e.DepartmentID
            ORDER BY e.Salary DESC, e.EmployeeID
        ) AS rn
    FROM dbo.Employees e
    JOIN dbo.Departments d ON d.DepartmentID = e.DepartmentID
)
SELECT DepartmentName, FullName, Salary
FROM x
WHERE rn = 1
ORDER BY DepartmentName;
