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
          Consumption,
          AVG(Consumption)
          OVER
          (
            partition by BuildingName, MeterType
            order by ReadingDate, UtilityReadingID
          )AS RunningAvgConsumptionPerBuildingMeterType,
          VAR(Consumption)
          OVER
          (
            partition by BuildingName, MeterType
            order by ReadingDate, UtilityReadingID
          )AS RunningConsumptionPerBuildingMeterTypeSamVar
    from UtilityReadings
    where Consumption is not null 

)
 
 select * from RunningStats

WHERE RunningConsumptionPerBuildingMeterTypeSamVar IS NOT NULL
  AND POWER(CAST(Consumption - RunningAvgConsumptionPerBuildingMeterType AS float), 2) > RunningConsumptionPerBuildingMeterTypeSamVar
ORDER BY BuildingName, MeterType, ReadingDate, UtilityReadingID;

