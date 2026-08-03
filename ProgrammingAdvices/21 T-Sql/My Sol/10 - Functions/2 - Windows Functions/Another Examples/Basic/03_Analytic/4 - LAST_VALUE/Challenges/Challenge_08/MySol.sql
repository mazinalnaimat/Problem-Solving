USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      UtilityReadingID,
      BuildingName,
      MeterType,
      ReadingDate,
      Cost,
	  LAST_VALUE(Cost)
	  OVER
	  (
		partition by BuildingName, MeterType
		order by ReadingDate, UtilityReadingID
		rows between
		unbounded preceding and unbounded following
	  ) LastCostPerBuildingMeterType
from UtilityReadings
order by  BuildingName, MeterType, ReadingDate, UtilityReadingID;


