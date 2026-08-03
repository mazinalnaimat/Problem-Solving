USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
      UtilityReadingID,
      BuildingName,
      MeterType,
      Consumption,
      PERCENTILE_CONT(0.90)
      within group (order by Consumption)
      OVER
      (
        partition by BuildingName, MeterType 
      )AS P90Consumption
from UtilityReadings
where Consumption is not null
order by BuildingName, MeterType, Consumption;
