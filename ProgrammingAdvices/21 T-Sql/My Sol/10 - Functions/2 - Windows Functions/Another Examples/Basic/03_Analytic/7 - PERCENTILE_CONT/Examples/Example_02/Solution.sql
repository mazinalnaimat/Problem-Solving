USE WindowFunctionsTrainingDB;
GO

SELECT DISTINCT
    Region,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Amount) OVER
    (
        PARTITION BY Region
    ) AS P75OrderAmount
FROM dbo.SalesOrders
ORDER BY Region;
