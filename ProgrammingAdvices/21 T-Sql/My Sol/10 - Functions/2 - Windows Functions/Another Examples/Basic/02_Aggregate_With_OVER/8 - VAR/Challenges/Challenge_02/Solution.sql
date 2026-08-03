USE WindowFunctionsTrainingDB;
GO

SELECT
    TripID,
    DriverName,
    DeliveryDate,
    FuelLiters,
    VAR(FuelLiters) OVER
    (
        PARTITION BY DriverName
        ORDER BY DeliveryDate, TripID
    ) AS RunningFuelSampleVarianceByDriverName
FROM dbo.DeliveryTrips
WHERE FuelLiters IS NOT NULL
ORDER BY DriverName, DeliveryDate, TripID;
