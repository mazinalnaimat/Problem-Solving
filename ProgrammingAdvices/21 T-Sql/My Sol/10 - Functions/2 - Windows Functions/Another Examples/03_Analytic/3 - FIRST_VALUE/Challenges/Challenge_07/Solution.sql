USE WindowFunctionsTrainingDB;
GO

SELECT
    TrafficID,
    SiteName,
    Channel,
    VisitDate,
    Revenue,
    FIRST_VALUE(Revenue) OVER
    (
        PARTITION BY SiteName, Channel
        ORDER BY VisitDate, TrafficID
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS FirstRevenue
FROM dbo.WebsiteTraffic
ORDER BY SiteName, Channel, VisitDate, TrafficID;
