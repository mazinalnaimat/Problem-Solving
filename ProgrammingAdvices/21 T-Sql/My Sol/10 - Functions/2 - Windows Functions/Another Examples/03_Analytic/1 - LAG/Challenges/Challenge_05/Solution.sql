USE WindowFunctionsTrainingDB;
GO

SELECT
    PaymentID,
    CustomerName,
    PaymentDate,
    Amount,
    LAG(Amount) OVER
    (
        PARTITION BY CustomerName
        ORDER BY PaymentDate, PaymentID
    ) AS PreviousAmount
FROM dbo.SubscriptionPayments
ORDER BY CustomerName, PaymentDate, PaymentID;
