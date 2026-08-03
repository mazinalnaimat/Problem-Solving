USE WindowFunctionsTrainingDB;
GO

SELECT
    UtilityReadingID,
    BuildingName,
    MeterType,
    Consumption,
    CUME_DIST() OVER
    (
        PARTITION BY BuildingName, MeterType
        ORDER BY Consumption
    ) AS DistributionValue
FROM dbo.UtilityReadings
WHERE Consumption IS NOT NULL
ORDER BY BuildingName, MeterType, Consumption;
