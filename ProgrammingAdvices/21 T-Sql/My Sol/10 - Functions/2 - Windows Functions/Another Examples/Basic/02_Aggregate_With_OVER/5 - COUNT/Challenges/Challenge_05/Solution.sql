USE WindowFunctionsTrainingDB;
GO

SELECT
    PaymentID,
    CustomerName,
    PlanName,
    PaymentDate,
    PaymentStatus,
    COUNT(CASE WHEN PaymentStatus = 'Paid' THEN 1 END) OVER
    (
        PARTITION BY CustomerName
        ORDER BY PaymentDate, PaymentID
        ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
    ) AS RemainingPaidPaymentCount
FROM dbo.SubscriptionPayments
ORDER BY CustomerName, PaymentDate, PaymentID;
