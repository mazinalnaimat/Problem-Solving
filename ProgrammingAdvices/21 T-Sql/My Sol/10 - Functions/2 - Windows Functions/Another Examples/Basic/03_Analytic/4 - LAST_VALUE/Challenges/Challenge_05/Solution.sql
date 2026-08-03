USE WindowFunctionsTrainingDB;
GO

SELECT
    PaymentID,
    CustomerName,
    PaymentDate,
    Amount,
    LAST_VALUE(Amount) OVER
    (
        PARTITION BY CustomerName
        ORDER BY PaymentDate, PaymentID
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS LastAmount
FROM dbo.SubscriptionPayments
ORDER BY CustomerName, PaymentDate, PaymentID;
