USE WindowFunctionsTrainingDB;
GO

SELECT
    TrafficID,
    SiteName,
    Channel,
    Sessions,
    CUME_DIST() OVER
    (
        PARTITION BY SiteName, Channel
        ORDER BY Sessions
    ) AS DistributionValue
FROM dbo.WebsiteTraffic
WHERE Sessions IS NOT NULL
ORDER BY SiteName, Channel, Sessions;
