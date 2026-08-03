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
        STDEV(Cost) OVER
        (
            PARTITION BY BuildingName, MeterType
            ORDER BY ReadingDate, UtilityReadingID
        ) AS RunningCostSampleDeviation
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
    RunningCostSampleDeviation
FROM RunningStats
WHERE RunningCostSampleDeviation IS NOT NULL
  AND ABS(Cost - RunningAverageCost) > RunningCostSampleDeviation
ORDER BY BuildingName, MeterType, ReadingDate, UtilityReadingID;
