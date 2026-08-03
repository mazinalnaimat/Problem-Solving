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
        STDEVP(Revenue) OVER
        (
            PARTITION BY SiteName, Channel
            ORDER BY VisitDate, TrafficID
        ) AS RunningRevenuePopulationDeviation
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
    RunningRevenuePopulationDeviation,
    CAST(Revenue - RunningAverageRevenue AS decimal(18,4)) AS DifferenceFromRunningAverage
FROM RunningStats
ORDER BY SiteName, Channel, VisitDate, TrafficID;
