USE WindowFunctionsTrainingDB;
GO

SELECT
    FullName,
    Salary,
    NTILE(4) OVER (ORDER BY Salary DESC, EmployeeID) AS SalaryGroup
FROM dbo.Employees
ORDER BY SalaryGroup, Salary DESC;
