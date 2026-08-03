USE WindowFunctionsTrainingDB;
GO

SELECT
    TrafficID,
    SiteName,
    Channel,
    VisitDate,
    Sessions,
    LEAD(Sessions) OVER
    (
        PARTITION BY SiteName, Channel
        ORDER BY VisitDate, TrafficID
    ) AS NextSessions
FROM dbo.WebsiteTraffic
ORDER BY SiteName, Channel, VisitDate, TrafficID;
