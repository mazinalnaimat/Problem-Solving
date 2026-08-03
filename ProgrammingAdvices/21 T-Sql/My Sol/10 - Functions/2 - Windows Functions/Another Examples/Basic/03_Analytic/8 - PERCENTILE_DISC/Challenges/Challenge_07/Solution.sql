USE WindowFunctionsTrainingDB;
GO

SELECT
    TrafficID,
    SiteName,
    Channel,
    Sessions,
    PERCENTILE_DISC(0.50) WITHIN GROUP (ORDER BY Sessions)
        OVER (PARTITION BY SiteName, Channel) AS PercentileValue
FROM dbo.WebsiteTraffic
WHERE Sessions IS NOT NULL
ORDER BY SiteName, Channel, Sessions;
