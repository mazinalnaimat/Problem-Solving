USE WindowFunctionsTrainingDB;
GO

SELECT
    TripID,
    Depot,
    RouteCode,
    DriverName,
    DeliveryDate,
    FuelLiters,
    AVG(FuelLiters) OVER
    (
        PARTITION BY Depot, RouteCode
        ORDER BY DeliveryDate, TripID
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS RouteAverageFuel
FROM dbo.DeliveryTrips
ORDER BY Depot, RouteCode, DeliveryDate, TripID;
