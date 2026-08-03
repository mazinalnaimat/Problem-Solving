USE WindowFunctionsTrainingDB;
GO

SELECT
    PaymentID,
    PlanName,
    PaymentStatus,
    CHECKSUM_AGG
    (
        CASE WHEN PaymentStatus = 'Paid' THEN PaymentID END
    ) OVER
    (
        PARTITION BY PlanName
    ) AS PaidPaymentIDChecksum
FROM dbo.SubscriptionPayments
ORDER BY PlanName, PaymentDate, PaymentID;
