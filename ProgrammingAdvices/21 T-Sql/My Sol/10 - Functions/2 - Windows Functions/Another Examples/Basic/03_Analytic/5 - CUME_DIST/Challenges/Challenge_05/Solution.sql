USE WindowFunctionsTrainingDB;
GO

SELECT
    PaymentID,
    PlanName,
    Country,
    Amount,
    CUME_DIST() OVER
    (
        PARTITION BY PlanName
        ORDER BY Amount
    ) AS DistributionValue
FROM dbo.SubscriptionPayments
WHERE Amount IS NOT NULL
ORDER BY PlanName, Amount;
