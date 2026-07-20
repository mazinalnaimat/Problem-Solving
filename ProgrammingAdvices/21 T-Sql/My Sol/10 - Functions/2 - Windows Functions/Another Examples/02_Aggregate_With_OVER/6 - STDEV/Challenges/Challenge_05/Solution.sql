USE WindowFunctionsTrainingDB;
GO

SELECT
    PaymentID,
    PlanName,
    PaymentDate,
    Amount,
    STDEV(Amount) OVER
    (
        PARTITION BY PlanName
        ORDER BY PaymentDate DESC, PaymentID DESC
    ) AS ReverseRunningAmountSampleDeviation
FROM dbo.SubscriptionPayments
WHERE Amount IS NOT NULL
ORDER BY PlanName, PaymentDate, PaymentID;
