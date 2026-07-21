USE WindowFunctionsTrainingDB;
GO

SELECT
    TripID,
    RouteCode,
    DeliveryDate,
    DistanceKm,
    STDEVP(DistanceKm) OVER
    (
        PARTITION BY RouteCode
        ORDER BY DeliveryDate, TripID
    ) AS RunningDistancePopulationDeviationByRouteCode
FROM dbo.DeliveryTrips
WHERE DistanceKm IS NOT NULL
ORDER BY RouteCode, DeliveryDate, TripID;
