USE WindowFunctionsTrainingDB;
GO

SELECT
    UtilityReadingID,
    BuildingName,
    MeterType,
    CHECKSUM_AGG(UtilityReadingID) OVER
    (
        PARTITION BY BuildingName, MeterType
    ) AS MeterReadingChecksum,
    CHECKSUM_AGG(UtilityReadingID) OVER () AS AllUtilityReadingChecksum
FROM dbo.UtilityReadings
ORDER BY BuildingName, MeterType, ReadingDate, UtilityReadingID;
