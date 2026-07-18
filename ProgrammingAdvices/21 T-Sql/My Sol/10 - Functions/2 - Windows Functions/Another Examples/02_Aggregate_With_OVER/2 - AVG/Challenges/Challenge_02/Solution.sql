USE WindowFunctionsTrainingDB;
GO

SELECT
    TripID,
    DriverName,
    Depot,
    DeliveryDate,
    DelayMinutes,
    AVG(CAST(DelayMinutes AS decimal(10,2))) OVER
    (
        PARTITION BY DriverName
        ORDER BY DeliveryDate, TripID
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningAverageDelay
FROM dbo.DeliveryTrips
ORDER BY DriverName, DeliveryDate, TripID;
