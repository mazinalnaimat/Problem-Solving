USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select     
      UtilityReadingID,
      BuildingName,
      MeterType,
      Consumption,
	  PERCENT_RANK()
	  OVER
	  (
		partition by BuildingName, MeterType
		order by Consumption
	  )AS ConsumptionPerBuildingMeterTypePercentRank
from UtilityReadings
where Consumption is not null
order by BuildingName, MeterType, Consumption;
