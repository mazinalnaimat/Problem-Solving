USE WindowFunctionsTrainingDB;
GO

SELECT
    TrafficID,
    SiteName,
    Channel,
    VisitDate,
    COUNT(*) OVER
    (
        PARTITION BY SiteName
    ) AS SiteRowCount,
    COUNT(*) OVER
    (
        PARTITION BY SiteName, Channel
    ) AS SiteChannelRowCount
FROM dbo.WebsiteTraffic
ORDER BY SiteName, Channel, VisitDate, TrafficID;
