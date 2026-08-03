USE WindowFunctionsTrainingDB;
GO

SELECT
    PaymentID,
    PlanName,
    PaymentDate,
    Amount,
    VAR(Amount) OVER
    (
        PARTITION BY PlanName
        ORDER BY PaymentDate DESC, PaymentID DESC
    ) AS ReverseRunningAmountSampleVariance
FROM dbo.SubscriptionPayments
WHERE Amount IS NOT NULL
ORDER BY PlanName, PaymentDate, PaymentID;
