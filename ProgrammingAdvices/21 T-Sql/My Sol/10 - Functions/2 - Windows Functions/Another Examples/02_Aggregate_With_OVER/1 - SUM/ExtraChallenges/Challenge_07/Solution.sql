/*
Challenge 07: Running sales total for each salesperson
Level: Intermediate+
*/

USE WindowFunctionsTrainingDB;
GO

SELECT
    so.SalesPersonID,
    e.FullName,
    so.OrderID,
    so.OrderDate,
    so.Amount,
    SUM(so.Amount) OVER
    (
        PARTITION BY so.SalesPersonID
        ORDER BY so.OrderDate, so.OrderID
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS SalesPersonRunningTotal
FROM dbo.SalesOrders AS so
INNER JOIN dbo.Employees AS e
    ON e.EmployeeID = so.SalesPersonID
ORDER BY so.SalesPersonID, so.OrderDate, so.OrderID;

