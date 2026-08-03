USE WindowFunctionsTrainingDB;
GO

SELECT
    CustomerName,
    OrderDate,
    Amount,
    LAG(Amount) OVER
    (
        PARTITION BY CustomerName
        ORDER BY OrderDate, OrderID
    ) AS PreviousOrderAmount
FROM dbo.SalesOrders
ORDER BY CustomerName, OrderDate;
