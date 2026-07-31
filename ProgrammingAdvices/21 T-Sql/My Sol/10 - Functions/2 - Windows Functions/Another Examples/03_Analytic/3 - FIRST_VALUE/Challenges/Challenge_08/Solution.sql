USE WindowFunctionsTrainingDB;
GO

SELECT
    UtilityReadingID,
    BuildingName,
    MeterType,
    ReadingDate,
    Cost,
    FIRST_VALUE(Cost) OVER
    (
        PARTITION BY BuildingName, MeterType
        ORDER BY ReadingDate, UtilityReadingID
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS FirstCost
FROM dbo.UtilityReadings
ORDER BY BuildingName, MeterType, ReadingDate, UtilityReadingID;
