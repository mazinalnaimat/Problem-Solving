USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select 
      UtilityReadingID,
      BuildingName,
      MeterType,
      ReadingDate,
      Consumption,
      LEAD(Consumption)
      OVER
      (
        partition by BuildingName, MeterType
        order by ReadingDate, UtilityReadingID
      )
      AS NextUtilityConsumption
from UtilityReadings
order by BuildingName, MeterType, ReadingDate, UtilityReadingID;


