USE WindowFunctionsTrainingDB;
GO

SELECT
    UtilityReadingID,
    BuildingName,
    MeterType,
    ReadingDate,
    Consumption,
    MIN(Consumption) OVER
    (
        PARTITION BY BuildingName, MeterType
        ORDER BY ReadingDate, UtilityReadingID
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningMinimumConsumption
FROM dbo.UtilityReadings
ORDER BY BuildingName, MeterType, ReadingDate, UtilityReadingID;
