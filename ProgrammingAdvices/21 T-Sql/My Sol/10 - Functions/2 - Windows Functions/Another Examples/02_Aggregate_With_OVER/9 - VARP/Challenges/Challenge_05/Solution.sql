USE WindowFunctionsTrainingDB;
GO

SELECT
    PaymentID,
    Country,
    PaymentDate,
    Seats,
    VARP(CAST(Seats AS decimal(10,2))) OVER
    (
        PARTITION BY Country
        ORDER BY PaymentDate DESC, PaymentID DESC
    ) AS ReverseRunningSeatPopulationVariance
FROM dbo.SubscriptionPayments
WHERE Seats IS NOT NULL
ORDER BY Country, PaymentDate, PaymentID;
