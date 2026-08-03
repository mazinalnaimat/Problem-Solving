USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select 
      UtilityReadingID,
      BuildingName,
      MeterType,
      ReadingDate,
      Consumption,
      LAG(Consumption)
      OVER
      (
        partition by BuildingName, MeterType
        order by  ReadingDate, UtilityReadingID
      )AS PreviousConsumption
from UtilityReadings
order by BuildingName, MeterType, ReadingDate, UtilityReadingID;


