USE WindowFunctionsTrainingDB;
GO

WITH DistinctMeters AS
(
    SELECT DISTINCT BuildingName, MeterType
    FROM dbo.UtilityReadings
)
SELECT
    BuildingName,
    COUNT(*) AS MeterTypeCount,
    STRING_AGG(CONVERT(nvarchar(max), MeterType), ', ')
        WITHIN GROUP (ORDER BY MeterType) AS MeterTypes
FROM DistinctMeters
GROUP BY BuildingName
HAVING COUNT(*) >= 2
ORDER BY BuildingName;
