USE WindowFunctionsTrainingDB;
GO

WITH RunningStats AS
(
    SELECT
        UtilityReadingID,
        BuildingName,
        MeterType,
        ReadingDate,
        Cost,
        AVG(Cost) OVER
        (
            PARTITION BY BuildingName, MeterType
            ORDER BY ReadingDate, UtilityReadingID
        ) AS RunningAverageCost,
        VARP(Cost) OVER
        (
            PARTITION BY BuildingName, MeterType
            ORDER BY ReadingDate, UtilityReadingID
        ) AS RunningCostPopulationVariance
    FROM dbo.UtilityReadings
    WHERE Cost IS NOT NULL
)
SELECT
    UtilityReadingID,
    BuildingName,
    MeterType,
    ReadingDate,
    Cost,
    RunningAverageCost,
    RunningCostPopulationVariance
FROM RunningStats
WHERE RunningCostPopulationVariance IS NOT NULL
  AND POWER(CAST(Cost - RunningAverageCost AS float), 2) > RunningCostPopulationVariance
ORDER BY BuildingName, MeterType, ReadingDate, UtilityReadingID;
