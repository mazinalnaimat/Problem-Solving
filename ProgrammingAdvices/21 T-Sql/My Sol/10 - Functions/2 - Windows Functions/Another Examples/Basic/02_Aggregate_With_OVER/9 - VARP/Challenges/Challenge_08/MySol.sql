USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

WITH RunningStats AS 
(
    select
         UtilityReadingID,
         BuildingName,
         MeterType,
         ReadingDate,
         Cost,
         AVG(Cost)
         OVER
         (
            partition by BuildingName, MeterType
            order by ReadingDate, UtilityReadingID 
         ) AS RunningAvgCostPerBuildingMeterType,
         VARP(Cost)
         OVER
         (
            partition by BuildingName, MeterType
            order by ReadingDate, UtilityReadingID 
         ) AS RunningCostPerBuildingMeterTypePopVar
    from UtilityReadings
    where Cost is not null
)

select *
from RunningStats
WHERE RunningCostPerBuildingMeterTypePopVar is not null 
  AND POWER(CAST(Cost - RunningAvgCostPerBuildingMeterType AS float), 2) > RunningCostPerBuildingMeterTypePopVar
ORDER BY BuildingName, MeterType, ReadingDate, UtilityReadingID;

