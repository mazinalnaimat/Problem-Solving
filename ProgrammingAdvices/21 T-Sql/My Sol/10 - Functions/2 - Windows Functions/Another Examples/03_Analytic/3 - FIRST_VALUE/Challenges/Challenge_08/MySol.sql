USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      UtilityReadingID,
      BuildingName,
      MeterType,
      ReadingDate,
      Cost,
      FIRST_VALUE(Cost)
      OVER
      (
        partition by BuildingName, MeterType
        order by ReadingDate, UtilityReadingID
      )AS FirstCostPerBuildingMeterType
from UtilityReadings
order by BuildingName, MeterType, ReadingDate, UtilityReadingID;

