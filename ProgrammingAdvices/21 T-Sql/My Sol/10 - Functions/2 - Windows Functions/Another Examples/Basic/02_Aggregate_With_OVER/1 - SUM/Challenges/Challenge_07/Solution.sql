USE WindowFunctionsTrainingDB;
GO

SELECT
    TrafficID,
    SiteName,
    Channel,
    VisitDate,
    Revenue,
    SUM(Revenue) OVER
    (
        PARTITION BY SiteName, Channel
    ) AS ChannelRevenue
FROM dbo.WebsiteTraffic
ORDER BY SiteName, Channel;
