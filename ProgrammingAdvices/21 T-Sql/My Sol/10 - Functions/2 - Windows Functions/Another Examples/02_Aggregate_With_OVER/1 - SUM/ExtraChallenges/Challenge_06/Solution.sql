/*
Challenge 06: Running total of all sales
Level: Intermediate
*/

USE WindowFunctionsTrainingDB;
GO

SELECT
    OrderID,
    OrderDate,
    CustomerName,
    Amount,
    SUM(Amount) OVER
    (
        ORDER BY OrderDate, OrderID
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningTotal
FROM dbo.SalesOrders
ORDER BY OrderDate, OrderID;

