USE WindowFunctionsTrainingDB;
GO

SELECT
    PaymentID,
    CustomerName,
    PlanName,
    Country,
    PaymentDate,
    Seats,
    MAX(Seats) OVER
    (
        PARTITION BY CustomerName
        ORDER BY PaymentDate, PaymentID
        ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
    ) AS FutureMaximumSeats
FROM dbo.SubscriptionPayments
ORDER BY CustomerName, PaymentDate, PaymentID;
