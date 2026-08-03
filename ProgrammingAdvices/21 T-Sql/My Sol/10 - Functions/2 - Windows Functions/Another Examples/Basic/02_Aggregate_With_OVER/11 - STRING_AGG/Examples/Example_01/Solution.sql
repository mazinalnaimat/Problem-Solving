USE WindowFunctionsTrainingDB;
GO

SELECT
    d.DepartmentName,
    STRING_AGG(e.FullName, ', ') WITHIN GROUP (ORDER BY e.FullName) AS Employees
FROM dbo.Employees e
JOIN dbo.Departments d ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName
ORDER BY d.DepartmentName;
