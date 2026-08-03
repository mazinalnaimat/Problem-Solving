USE WindowFunctionsTrainingDB;
GO

WITH RunningStats AS
(
    SELECT
        TrafficID,
        SiteName,
        Channel,
        VisitDate,
        Revenue,
        AVG(Revenue) OVER
        (
            PARTITION BY SiteName, Channel
            ORDER BY VisitDate, TrafficID
        ) AS RunningAverageRevenue,
        VAR(Revenue) OVER
        (
            PARTITION BY SiteName, Channel
            ORDER BY VisitDate, TrafficID
        ) AS RunningRevenueSampleVariance
    FROM dbo.WebsiteTraffic
    WHERE Revenue IS NOT NULL
)
SELECT
    TrafficID,
    SiteName,
    Channel,
    VisitDate,
    Revenue,
    RunningAverageRevenue,
    RunningRevenueSampleVariance,
    CAST(Revenue - RunningAverageRevenue AS decimal(18,4)) AS DifferenceFromRunningAverage
FROM RunningStats
ORDER BY SiteName, Channel, VisitDate, TrafficID;
