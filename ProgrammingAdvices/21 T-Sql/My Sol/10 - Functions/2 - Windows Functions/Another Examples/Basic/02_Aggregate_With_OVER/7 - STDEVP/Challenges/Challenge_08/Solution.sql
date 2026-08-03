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
        STDEVP(Cost) OVER
        (
            PARTITION BY BuildingName, MeterType
            ORDER BY ReadingDate, UtilityReadingID
        ) AS RunningCostPopulationDeviation
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
    RunningCostPopulationDeviation
FROM RunningStats
WHERE RunningCostPopulationDeviation IS NOT NULL
  AND ABS(Cost - RunningAverageCost) > RunningCostPopulationDeviation
ORDER BY BuildingName, MeterType, ReadingDate, UtilityReadingID;
