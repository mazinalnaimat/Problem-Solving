USE WindowFunctionsTrainingDB;
GO

SELECT
    CustomerName,
    OrderDate,
    Amount,
    LEAD(Amount) OVER
    (
        PARTITION BY CustomerName
        ORDER BY OrderDate, OrderID
    ) AS NextOrderAmount
FROM dbo.SalesOrders
ORDER BY CustomerName, OrderDate;
