USE WindowFunctionsTrainingDB;
GO

SELECT
    OrderID,
    CustomerName,
    Amount,
    NTILE(5) OVER (ORDER BY Amount DESC, OrderID) AS AmountGroup
FROM dbo.SalesOrders
ORDER BY AmountGroup, Amount DESC;
