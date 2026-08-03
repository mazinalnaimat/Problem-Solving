USE WindowFunctionsTrainingDB;
GO

SELECT
    TrafficID,
    SiteName,
    Channel,
    VisitDate,
    Sessions,
    LAG(Sessions) OVER
    (
        PARTITION BY SiteName, Channel
        ORDER BY VisitDate, TrafficID
    ) AS PreviousSessions
FROM dbo.WebsiteTraffic
ORDER BY SiteName, Channel, VisitDate, TrafficID;
