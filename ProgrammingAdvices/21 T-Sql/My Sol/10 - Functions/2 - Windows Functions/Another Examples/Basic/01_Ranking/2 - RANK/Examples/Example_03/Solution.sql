USE WindowFunctionsTrainingDB;
GO

WITH SalesTotals AS
(
    SELECT
        e.EmployeeID,
        e.FullName,
        SUM(o.Amount) AS TotalSales
    FROM dbo.SalesOrders o
    JOIN dbo.Employees e ON e.EmployeeID = o.SalesPersonID
    GROUP BY e.EmployeeID, e.FullName
)
SELECT
    FullName,
    TotalSales,
    RANK() OVER (ORDER BY TotalSales DESC) AS SalesRank
FROM SalesTotals
ORDER BY SalesRank, FullName;
