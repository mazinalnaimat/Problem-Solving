USE WindowFunctionsTrainingDB;
GO

SELECT
    TrafficID,
    SiteName,
    Channel,
    CHECKSUM_AGG(TrafficID) OVER
    (
        PARTITION BY SiteName
    ) AS SiteTrafficChecksum,
    CHECKSUM_AGG(TrafficID) OVER
    (
        PARTITION BY SiteName, Channel
    ) AS SiteChannelTrafficChecksum
FROM dbo.WebsiteTraffic
ORDER BY SiteName, Channel, VisitDate, TrafficID;
