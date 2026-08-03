USE WindowFunctionsTrainingDB;
GO

SELECT
    TripID,
    Depot,
    RouteCode,
    DriverName,
    DeliveryDate,
    PackagesDelivered,
    MIN(PackagesDelivered) OVER
    (
        PARTITION BY Depot, RouteCode
        ORDER BY DeliveryDate, TripID
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS RouteMinimumPackages
FROM dbo.DeliveryTrips
ORDER BY Depot, RouteCode, DeliveryDate, TripID;
