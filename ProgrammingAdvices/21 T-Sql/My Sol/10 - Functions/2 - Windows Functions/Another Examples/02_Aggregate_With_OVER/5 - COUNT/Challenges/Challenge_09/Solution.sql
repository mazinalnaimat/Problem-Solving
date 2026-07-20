USE WindowFunctionsTrainingDB;
GO

SELECT
    UtilityReadingID,
    BuildingName,
    MeterType,
    ReadingDate,
    COUNT(*) OVER
    (
        PARTITION BY BuildingName, MeterType
        ORDER BY ReadingDate, UtilityReadingID
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningReadingCount,
    COUNT(*) OVER
    (
        PARTITION BY BuildingName, MeterType
        ORDER BY ReadingDate, UtilityReadingID
        ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
    ) AS RemainingReadingCount
FROM dbo.UtilityReadings
ORDER BY BuildingName, MeterType, ReadingDate, UtilityReadingID;
