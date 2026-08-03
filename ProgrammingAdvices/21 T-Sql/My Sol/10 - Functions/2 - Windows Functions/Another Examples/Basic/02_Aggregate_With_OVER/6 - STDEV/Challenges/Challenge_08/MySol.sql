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
            rows between
            unbounded preceding and current row
          ) AS RunningAvgCostPerBuildingMeterType,
          STDEV(Cost)
          OVER
          (
            partition by BuildingName, MeterType
            order by ReadingDate, UtilityReadingID
            rows between
            unbounded preceding and current row
          ) AS RunningCostPerBuildingMeterTypeSampleDev
    from UtilityReadings
    where cost is not null
)

select 
      *
from RunningStats
where RunningCostPerBuildingMeterTypeSampleDev is not null
     AND ABS(Cost - RunningAvgCostPerBuildingMeterType) > RunningCostPerBuildingMeterTypeSampleDev
ORDER BY BuildingName, MeterType, ReadingDate, UtilityReadingID;
