USE WindowFunctionsTrainingDB;
GO

SELECT
    Region,
    OrderID,
    Amount,
    DENSE_RANK() OVER (PARTITION BY Region ORDER BY Amount DESC) AS DenseAmountRank
FROM dbo.SalesOrders
ORDER BY Region, DenseAmountRank;
