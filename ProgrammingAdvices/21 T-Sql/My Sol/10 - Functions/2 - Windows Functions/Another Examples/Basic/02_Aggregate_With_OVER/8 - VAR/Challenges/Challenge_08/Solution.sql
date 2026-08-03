USE WindowFunctionsTrainingDB;
GO

WITH RunningStats AS
(
    SELECT
        UtilityReadingID,
        BuildingName,
        MeterType,
        ReadingDate,
        Consumption,
        AVG(Consumption) OVER
        (
            PARTITION BY BuildingName, MeterType
            ORDER BY ReadingDate, UtilityReadingID
        ) AS RunningAverageConsumption,
        VAR(Consumption) OVER
        (
            PARTITION BY BuildingName, MeterType
            ORDER BY ReadingDate, UtilityReadingID
        ) AS RunningConsumptionSampleVariance
    FROM dbo.UtilityReadings
    WHERE Consumption IS NOT NULL
)
SELECT
    UtilityReadingID,
    BuildingName,
    MeterType,
    ReadingDate,
    Consumption,
    RunningAverageConsumption,
    RunningConsumptionSampleVariance
FROM RunningStats
WHERE RunningConsumptionSampleVariance IS NOT NULL
  AND POWER(CAST(Consumption - RunningAverageConsumption AS float), 2) > RunningConsumptionSampleVariance
ORDER BY BuildingName, MeterType, ReadingDate, UtilityReadingID;
