USE WindowFunctionsTrainingDB;
GO

SELECT
    PaymentID,
    PlanName,
    Country,
    Amount,
    PERCENTILE_CONT(0.80) WITHIN GROUP (ORDER BY Amount)
        OVER (PARTITION BY PlanName, Country) AS PercentileValue
FROM dbo.SubscriptionPayments
WHERE Amount IS NOT NULL
ORDER BY PlanName, Country, Amount;
