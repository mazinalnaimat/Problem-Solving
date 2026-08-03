USE WindowFunctionsTrainingDB;
GO

WITH x AS
(
    SELECT
        EmployeeID,
        FullName,
        ROW_NUMBER() OVER (ORDER BY EmployeeID) AS rn
    FROM dbo.Employees
)
SELECT EmployeeID, FullName, rn
FROM x
WHERE rn BETWEEN 11 AND 16
ORDER BY rn;
