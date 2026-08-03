USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
      UtilityReadingID,
      BuildingName,
      MeterType,
      Consumption,
      PERCENTILE_DISC(0.90)
      within group (order by Consumption)
      OVER
      (
        partition by BuildingName, MeterType 
      )AS DiscreteP90Consumption
from UtilityReadings
where Consumption is not null
order by BuildingName, MeterType, Consumption;
