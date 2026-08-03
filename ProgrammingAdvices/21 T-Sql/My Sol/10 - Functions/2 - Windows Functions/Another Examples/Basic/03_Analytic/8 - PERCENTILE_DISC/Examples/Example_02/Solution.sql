USE WindowFunctionsTrainingDB;
GO

SELECT DISTINCT
    Region,
    PERCENTILE_DISC(0.75) WITHIN GROUP (ORDER BY Amount) OVER
    (
        PARTITION BY Region
    ) AS DiscreteP75OrderAmount
FROM dbo.SalesOrders
ORDER BY Region;
