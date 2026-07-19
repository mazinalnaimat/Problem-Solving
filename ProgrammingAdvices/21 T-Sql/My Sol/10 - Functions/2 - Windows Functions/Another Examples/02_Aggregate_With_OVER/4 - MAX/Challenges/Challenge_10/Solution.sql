USE WindowFunctionsTrainingDB;
GO

SELECT
    TripID,
    Depot,
    RouteCode,
    DriverName,
    DeliveryDate,
    DistanceKm,
    MAX(DistanceKm) OVER
    (
        PARTITION BY Depot, RouteCode
        ORDER BY DeliveryDate, TripID
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS RouteMaximumDistance
FROM dbo.DeliveryTrips
ORDER BY Depot, RouteCode, DeliveryDate, TripID;
