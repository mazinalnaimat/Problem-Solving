USE WindowFunctionsTrainingDB;
GO

WITH x AS
(
    SELECT e.FullName, SUM(o.Amount) AS TotalSales
    FROM dbo.SalesOrders o
    JOIN dbo.Employees e ON e.EmployeeID = o.SalesPersonID
    GROUP BY e.FullName
)
SELECT
    FullName,
    TotalSales,
    RANK() OVER (ORDER BY TotalSales DESC) AS SalesRank
FROM x
ORDER BY SalesRank;
