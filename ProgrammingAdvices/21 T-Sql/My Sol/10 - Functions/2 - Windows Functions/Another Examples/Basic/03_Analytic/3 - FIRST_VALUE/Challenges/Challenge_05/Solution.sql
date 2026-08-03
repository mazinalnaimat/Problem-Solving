USE WindowFunctionsTrainingDB;
GO

SELECT
    PaymentID,
    CustomerName,
    PaymentDate,
    Amount,
    FIRST_VALUE(Amount) OVER
    (
        PARTITION BY CustomerName
        ORDER BY PaymentDate, PaymentID
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS FirstAmount
FROM dbo.SubscriptionPayments
ORDER BY CustomerName, PaymentDate, PaymentID;
