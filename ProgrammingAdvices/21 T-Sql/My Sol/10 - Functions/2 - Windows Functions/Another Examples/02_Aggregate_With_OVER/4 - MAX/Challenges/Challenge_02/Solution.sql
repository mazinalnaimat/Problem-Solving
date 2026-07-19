USE WindowFunctionsTrainingDB;
GO

SELECT
    TripID,
    DriverName,
    Depot,
    DeliveryDate,
    PackagesDelivered,
    MAX(PackagesDelivered) OVER
    (
        PARTITION BY DriverName
        ORDER BY DeliveryDate, TripID
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningMaximumPackages
FROM dbo.DeliveryTrips
ORDER BY DriverName, DeliveryDate, TripID;
