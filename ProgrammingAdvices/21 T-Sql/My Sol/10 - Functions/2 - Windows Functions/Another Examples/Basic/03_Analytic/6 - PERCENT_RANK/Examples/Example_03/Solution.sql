USE WindowFunctionsTrainingDB;
GO

SELECT
    Region,
    OrderID,
    Amount,
    PERCENT_RANK() OVER
    (
        PARTITION BY Region
        ORDER BY Amount
    ) AS AmountPercentRank
FROM dbo.SalesOrders
ORDER BY Region, Amount;
