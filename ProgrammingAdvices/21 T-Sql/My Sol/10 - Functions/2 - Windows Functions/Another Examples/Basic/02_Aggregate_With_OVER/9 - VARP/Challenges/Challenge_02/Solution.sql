USE WindowFunctionsTrainingDB;
GO

SELECT
    TripID,
    RouteCode,
    DeliveryDate,
    PackagesDelivered,
    VARP(CAST(PackagesDelivered AS decimal(10,2))) OVER
    (
        PARTITION BY RouteCode
        ORDER BY DeliveryDate, TripID
    ) AS RunningPackagePopulationVarianceByRouteCode
FROM dbo.DeliveryTrips
WHERE PackagesDelivered IS NOT NULL
ORDER BY RouteCode, DeliveryDate, TripID;
