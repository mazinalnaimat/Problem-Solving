USE WindowFunctionsTrainingDB;
GO

SELECT
    TripID,
    DriverName,
    DeliveryDate,
    DelayMinutes,
    STDEV(CAST(DelayMinutes AS decimal(10,2))) OVER
    (
        PARTITION BY DriverName
        ORDER BY DeliveryDate, TripID
    ) AS RunningDelaySampleDeviationByDriverName
FROM dbo.DeliveryTrips
WHERE DelayMinutes IS NOT NULL
ORDER BY DriverName, DeliveryDate, TripID;
