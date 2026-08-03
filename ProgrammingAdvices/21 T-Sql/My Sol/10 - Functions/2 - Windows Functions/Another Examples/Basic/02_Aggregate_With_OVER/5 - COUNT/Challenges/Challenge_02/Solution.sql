USE WindowFunctionsTrainingDB;
GO

SELECT
    TripID,
    DriverName,
    Depot,
    DeliveryDate,
    COUNT(*) OVER
    (
        PARTITION BY DriverName
        ORDER BY DeliveryDate, TripID
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningTripCount
FROM dbo.DeliveryTrips
ORDER BY DriverName, DeliveryDate, TripID;
