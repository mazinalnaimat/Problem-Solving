USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.



select 
      UtilityReadingID,
      BuildingName,
      MeterType,
      Consumption,
      CUME_DIST()
      OVER
      (
        partition by BuildingName, MeterType
        order by Consumption
      )AS ConsumptionPerBuildingMeterTypeCumeDist
from UtilityReadings
where Consumption is not null
order by BuildingName, MeterType, Consumption;

