USE WindowFunctionsTrainingDB;
GO

SELECT
    PaymentID,
    PlanName,
    Country,
    Amount,
    PERCENT_RANK() OVER
    (
        PARTITION BY PlanName
        ORDER BY Amount
    ) AS DistributionValue
FROM dbo.SubscriptionPayments
WHERE Amount IS NOT NULL
ORDER BY PlanName, Amount;
