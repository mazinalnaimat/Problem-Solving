USE WindowFunctionsTrainingDB;
GO

WITH EmployeeRows AS
(
    SELECT
        EmployeeID,
        FullName,
        Salary,
        ROW_NUMBER() OVER (ORDER BY EmployeeID) AS RowNum
    FROM dbo.Employees
)
SELECT *
FROM EmployeeRows
WHERE RowNum BETWEEN 6 AND 10
ORDER BY RowNum;
