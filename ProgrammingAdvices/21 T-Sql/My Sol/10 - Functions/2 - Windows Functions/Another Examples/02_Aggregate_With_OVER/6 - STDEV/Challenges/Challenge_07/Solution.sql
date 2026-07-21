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
        STDEV(Revenue) OVER
        (
            PARTITION BY SiteName, Channel
            ORDER BY VisitDate, TrafficID
        ) AS RunningRevenueSampleDeviation
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
    RunningRevenueSampleDeviation,
    CAST(Revenue - RunningAverageRevenue AS decimal(18,4)) AS DifferenceFromRunningAverage
FROM RunningStats
ORDER BY SiteName, Channel, VisitDate, TrafficID;
