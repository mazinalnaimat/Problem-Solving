USE WindowFunctionsTrainingDB;
GO

SELECT
    PaymentID,
    Country,
    PaymentDate,
    Seats,
    STDEVP(CAST(Seats AS decimal(10,2))) OVER
    (
        PARTITION BY Country
        ORDER BY PaymentDate DESC, PaymentID DESC
    ) AS ReverseRunningSeatPopulationDeviation
FROM dbo.SubscriptionPayments
WHERE Seats IS NOT NULL
ORDER BY Country, PaymentDate, PaymentID;
