USE WindowFunctionsTrainingDB;
GO

WITH RouteCounts AS
(
    SELECT
        TripID,
        Depot,
        RouteCode,
        DriverName,
        DeliveryDate,
        DelayMinutes,
        COUNT(*) OVER
        (
            PARTITION BY Depot, RouteCode
        ) AS RouteTripCount,
        COUNT(CASE WHEN DelayMinutes > 10 THEN 1 END) OVER
        (
            PARTITION BY Depot, RouteCode
        ) AS DelayedRouteTripCount
    FROM dbo.DeliveryTrips
)
SELECT
    TripID,
    Depot,
    RouteCode,
    DriverName,
    DelayMinutes,
    RouteTripCount,
    DelayedRouteTripCount,
    CAST(100.0 * DelayedRouteTripCount / NULLIF(RouteTripCount, 0) AS decimal(6,2)) AS DelayedTripPercentage
FROM RouteCounts
ORDER BY Depot, RouteCode, DeliveryDate, TripID;
