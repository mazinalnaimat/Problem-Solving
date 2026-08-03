USE WindowFunctionsTrainingDB;
GO

SELECT
    TrafficID,
    SiteName,
    Channel,
    VisitDate,
    Revenue,
    MAX(Revenue) OVER
    (
        PARTITION BY SiteName, Channel
    ) AS ChannelMaximumRevenue
FROM dbo.WebsiteTraffic
ORDER BY SiteName, Channel;
