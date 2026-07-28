USE WindowFunctionsTrainingDB;
GO

WITH RouteCounts AS
(
    SELECT
        Depot,
        RouteCode,
        COUNT(*) AS TripCount
    FROM dbo.DeliveryTrips
    GROUP BY Depot, RouteCode
)
SELECT
    Depot,
    STRING_AGG
    (
        CONVERT(nvarchar(max), CONCAT(RouteCode, ' (', TripCount, ' trips)')),
        '; '
    ) WITHIN GROUP (ORDER BY RouteCode) AS RouteSummary
FROM RouteCounts
GROUP BY Depot
ORDER BY Depot;
