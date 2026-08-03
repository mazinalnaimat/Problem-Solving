/*
Challenge 03: Show every order with the grand total
Level: Beginner+
*/

USE WindowFunctionsTrainingDB;
GO

SELECT
    OrderID,
    OrderDate,
    CustomerName,
    Amount,
    SUM(Amount) OVER () AS GrandTotal
FROM dbo.SalesOrders
ORDER BY OrderDate, OrderID;

