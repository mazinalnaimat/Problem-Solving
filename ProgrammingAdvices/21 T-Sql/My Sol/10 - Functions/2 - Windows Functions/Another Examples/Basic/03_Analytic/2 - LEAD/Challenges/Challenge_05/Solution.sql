USE WindowFunctionsTrainingDB;
GO

SELECT
    PaymentID,
    CustomerName,
    PaymentDate,
    Amount,
    LEAD(Amount) OVER
    (
        PARTITION BY CustomerName
        ORDER BY PaymentDate, PaymentID
    ) AS NextAmount
FROM dbo.SubscriptionPayments
ORDER BY CustomerName, PaymentDate, PaymentID;
