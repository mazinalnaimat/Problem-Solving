USE WindowFunctionsTrainingDB;
GO

WITH RunningStats AS
(
    SELECT
        TrafficID,
        SiteName,
        Channel,
        VisitDate,
        Conversions,
        AVG(CAST(Conversions AS decimal(10,2))) OVER
        (
            PARTITION BY SiteName, Channel
            ORDER BY VisitDate, TrafficID
        ) AS RunningAverageConversions,
        VARP(CAST(Conversions AS decimal(10,2))) OVER
        (
            PARTITION BY SiteName, Channel
            ORDER BY VisitDate, TrafficID
        ) AS RunningConversionPopulationVariance
    FROM dbo.WebsiteTraffic
    WHERE Conversions IS NOT NULL
)
SELECT
    TrafficID,
    SiteName,
    Channel,
    VisitDate,
    Conversions,
    RunningAverageConversions,
    RunningConversionPopulationVariance,
    CAST(CAST(Conversions AS decimal(10,2)) - RunningAverageConversions AS decimal(18,4)) AS DifferenceFromRunningAverage
FROM RunningStats
ORDER BY SiteName, Channel, VisitDate, TrafficID;
