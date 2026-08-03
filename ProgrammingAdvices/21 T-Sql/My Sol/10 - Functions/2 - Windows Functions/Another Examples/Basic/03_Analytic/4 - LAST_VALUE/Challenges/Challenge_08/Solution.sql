USE WindowFunctionsTrainingDB;
GO

SELECT
    UtilityReadingID,
    BuildingName,
    MeterType,
    ReadingDate,
    Cost,
    LAST_VALUE(Cost) OVER
    (
        PARTITION BY BuildingName, MeterType
        ORDER BY ReadingDate, UtilityReadingID
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS LastCost
FROM dbo.UtilityReadings
ORDER BY BuildingName, MeterType, ReadingDate, UtilityReadingID;
