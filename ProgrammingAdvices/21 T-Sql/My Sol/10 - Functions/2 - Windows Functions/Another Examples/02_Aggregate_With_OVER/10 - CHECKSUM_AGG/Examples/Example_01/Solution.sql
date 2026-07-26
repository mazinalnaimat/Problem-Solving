USE WindowFunctionsTrainingDB;
GO

SELECT
    d.DepartmentName,
    e.EmployeeID,
    e.FullName,
    CHECKSUM_AGG(e.EmployeeID) OVER
    (
        PARTITION BY e.DepartmentID
    ) AS EmployeeChecksumInDepartment
FROM dbo.Employees e
JOIN dbo.Departments d ON d.DepartmentID = e.DepartmentID
ORDER BY d.DepartmentName, e.EmployeeID;
