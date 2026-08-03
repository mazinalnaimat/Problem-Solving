USE WindowFunctionsTrainingDB;
GO

SELECT
    e.FullName AS SalesPerson,
    o.OrderID,
    o.OrderDate,
    o.Amount,
    SUM(o.Amount) OVER
    (
        PARTITION BY o.SalesPersonID ORDER BY o.OrderDate, o.OrderID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningSalesForPerson
FROM dbo.SalesOrders o
JOIN dbo.Employees e ON e.EmployeeID = o.SalesPersonID
ORDER BY e.FullName, o.OrderDate, o.OrderID;
