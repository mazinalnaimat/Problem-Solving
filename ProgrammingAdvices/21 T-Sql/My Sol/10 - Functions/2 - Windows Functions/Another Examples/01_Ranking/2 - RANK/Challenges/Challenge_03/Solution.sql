USE WindowFunctionsTrainingDB;
GO

SELECT
    Region,
    OrderID,
    Amount,
    RANK() OVER (PARTITION BY Region ORDER BY Amount DESC) AS AmountRank
FROM dbo.SalesOrders
ORDER BY Region, AmountRank;
