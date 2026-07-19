USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      UtilityReadingID,
      BuildingName,
      MeterType,
      ReadingDate,
      Consumption,
	  MIN(Consumption)
	  OVER
	  (
		partition by  BuildingName, MeterType
		order by ReadingDate, UtilityReadingID
		rows between 
		unbounded preceding and current row
	  )AS RunningMinConsumption
from UtilityReadings
ORDER BY BuildingName, MeterType, ReadingDate, UtilityReadingID;

