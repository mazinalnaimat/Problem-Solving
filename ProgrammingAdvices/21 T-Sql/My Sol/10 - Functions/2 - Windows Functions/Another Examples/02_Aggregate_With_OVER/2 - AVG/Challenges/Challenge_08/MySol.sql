USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

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
	  )
	  AS RunningAverageConsumption 
from UtilityReadings
order by BuildingName, MeterType, ReadingDate, UtilityReadingID
