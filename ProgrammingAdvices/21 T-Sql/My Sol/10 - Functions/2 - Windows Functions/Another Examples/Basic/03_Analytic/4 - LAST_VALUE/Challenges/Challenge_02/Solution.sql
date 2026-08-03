USE WindowFunctionsTrainingDB;
GO

SELECT
    TripID,
    DriverName,
    DeliveryDate,
    DelayMinutes,
    LAST_VALUE(DelayMinutes) OVER
    (
        PARTITION BY DriverName
        ORDER BY DeliveryDate, TripID
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS LastDelayMinutes
FROM dbo.DeliveryTrips
ORDER BY DriverName, DeliveryDate, TripID;
