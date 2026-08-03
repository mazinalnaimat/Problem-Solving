USE WindowFunctionsTrainingDB;
GO

SELECT
    TripID,
    DriverName,
    DeliveryDate,
    DelayMinutes,
    LEAD(DelayMinutes) OVER
    (
        PARTITION BY DriverName
        ORDER BY DeliveryDate, TripID
    ) AS NextDelayMinutes
FROM dbo.DeliveryTrips
ORDER BY DriverName, DeliveryDate, TripID;
