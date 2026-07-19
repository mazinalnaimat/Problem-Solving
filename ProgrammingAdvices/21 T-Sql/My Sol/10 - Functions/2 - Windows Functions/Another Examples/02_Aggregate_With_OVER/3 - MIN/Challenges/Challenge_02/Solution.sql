USE WindowFunctionsTrainingDB;
GO

SELECT
    TripID,
    DriverName,
    Depot,
    DeliveryDate,
    DelayMinutes,
    MIN(DelayMinutes) OVER
    (
        PARTITION BY DriverName
        ORDER BY DeliveryDate, TripID
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningMinimumDelay
FROM dbo.DeliveryTrips
ORDER BY DriverName, DeliveryDate, TripID;
