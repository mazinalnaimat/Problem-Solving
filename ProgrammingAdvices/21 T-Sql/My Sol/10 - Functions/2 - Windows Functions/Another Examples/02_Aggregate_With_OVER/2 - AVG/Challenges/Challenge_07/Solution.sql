USE WindowFunctionsTrainingDB;
GO

SELECT
    TrafficID,
    SiteName,
    Channel,
    VisitDate,
    Conversions,
    AVG(CAST(Conversions AS decimal(10,2))) OVER
    (
        PARTITION BY SiteName, Channel
    ) AS ChannelAverageConversions
FROM dbo.WebsiteTraffic
ORDER BY SiteName, Channel;
