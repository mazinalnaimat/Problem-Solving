USE WindowFunctionsTrainingDB;
GO

SELECT
    PaymentID,
    CustomerName,
    PlanName,
    Country,
    PaymentDate,
    Amount,
    MIN(Amount) OVER
    (
        PARTITION BY CustomerName
        ORDER BY PaymentDate, PaymentID
        ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
    ) AS FutureMinimumPayment
FROM dbo.SubscriptionPayments
ORDER BY CustomerName, PaymentDate, PaymentID;
