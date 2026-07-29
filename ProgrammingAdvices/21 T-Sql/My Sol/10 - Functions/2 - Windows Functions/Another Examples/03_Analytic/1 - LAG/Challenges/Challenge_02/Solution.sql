USE WindowFunctionsTrainingDB;
GO

SELECT
    TripID,
    DriverName,
    DeliveryDate,
    DelayMinutes,
    LAG(DelayMinutes) OVER
    (
        PARTITION BY DriverName
        ORDER BY DeliveryDate, TripID
    ) AS PreviousDelayMinutes
FROM dbo.DeliveryTrips
ORDER BY DriverName, DeliveryDate, TripID;
