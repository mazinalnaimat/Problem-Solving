USE WindowFunctionsTrainingDB;
GO

WITH DistinctRoutes AS
(
    SELECT DISTINCT Depot, RouteCode
    FROM dbo.DeliveryTrips
)
SELECT
    Depot,
    STRING_AGG(CONVERT(nvarchar(max), RouteCode), ', ')
        WITHIN GROUP (ORDER BY RouteCode) AS RouteCodes
FROM DistinctRoutes
GROUP BY Depot
ORDER BY Depot;
