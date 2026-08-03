USE WindowFunctionsTrainingDB;
GO

SELECT
    OrderID,
    CustomerName,
    Amount,
    NTILE(4) OVER (ORDER BY Amount DESC, OrderID) AS AmountBucket
FROM dbo.SalesOrders
ORDER BY AmountBucket, Amount DESC;
