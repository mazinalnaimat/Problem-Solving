USE WindowFunctionsTrainingDB;
GO

SELECT
    TrafficID,
    SiteName,
    Channel,
    VisitDate,
    Sessions,
    MIN(Sessions) OVER
    (
        PARTITION BY SiteName, Channel
    ) AS ChannelMinimumSessions
FROM dbo.WebsiteTraffic
ORDER BY SiteName, Channel;
