USE WindowFunctionsTrainingDB;
GO

SELECT
    Region,
    OrderID,
    Amount,
    CUME_DIST() OVER
    (
        PARTITION BY Region
        ORDER BY Amount
    ) AS AmountCumeDist
FROM dbo.SalesOrders
ORDER BY Region, Amount;
