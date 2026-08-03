USE WindowFunctionsTrainingDB;
GO

SELECT
    FullName,
    Salary,
    NTILE(4) OVER (ORDER BY Salary DESC, EmployeeID) AS SalaryQuartile
FROM dbo.Employees
ORDER BY SalaryQuartile, Salary DESC;
