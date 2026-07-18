USE WindowFunctionsTrainingDB;
GO

SELECT
    FullName,
    PerformanceScore,
    ROW_NUMBER() OVER (ORDER BY PerformanceScore DESC, EmployeeID) AS RowNum
FROM dbo.Employees
ORDER BY RowNum;
