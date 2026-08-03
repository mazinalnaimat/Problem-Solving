USE WindowFunctionsTrainingDB;
GO

SELECT
    TripID,
    Depot,
    RouteCode,
    DriverName,
    DeliveryDate,
    DelayMinutes,
    SUM(DelayMinutes) OVER
    (
        PARTITION BY Depot, RouteCode
        ORDER BY DeliveryDate, TripID
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS RouteDelayTotal
FROM dbo.DeliveryTrips
ORDER BY Depot, RouteCode, DeliveryDate, TripID;
