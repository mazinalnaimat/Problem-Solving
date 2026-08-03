USE WindowFunctionsTrainingDB;
GO

SELECT
    TripID,
    DriverName,
    DeliveryDate,
    DelayMinutes,
    FIRST_VALUE(DelayMinutes) OVER
    (
        PARTITION BY DriverName
        ORDER BY DeliveryDate, TripID
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS FirstDelayMinutes
FROM dbo.DeliveryTrips
ORDER BY DriverName, DeliveryDate, TripID;
