USE WindowFunctionsTrainingDB;
GO

SELECT
    UtilityReadingID,
    BuildingName,
    MeterType,
    ReadingDate,
    Consumption,
    LEAD(Consumption) OVER
    (
        PARTITION BY BuildingName, MeterType
        ORDER BY ReadingDate, UtilityReadingID
    ) AS NextConsumption
FROM dbo.UtilityReadings
ORDER BY BuildingName, MeterType, ReadingDate, UtilityReadingID;
