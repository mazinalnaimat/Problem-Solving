USE WindowFunctionsTrainingDB;
GO

SELECT
    UtilityReadingID,
    BuildingName,
    MeterType,
    Consumption,
    PERCENTILE_CONT(0.90) WITHIN GROUP (ORDER BY Consumption)
        OVER (PARTITION BY BuildingName, MeterType) AS PercentileValue
FROM dbo.UtilityReadings
WHERE Consumption IS NOT NULL
ORDER BY BuildingName, MeterType, Consumption;
