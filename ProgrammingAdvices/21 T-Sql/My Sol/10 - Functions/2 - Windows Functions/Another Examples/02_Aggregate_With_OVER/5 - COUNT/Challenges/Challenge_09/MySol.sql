USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select 
      UtilityReadingID,
      BuildingName,
      MeterType,
      ReadingDate,
      COUNT(*)
      OVER
      (
        partition by BuildingName, MeterType 
        order by ReadingDate, UtilityReadingID
        rows between
        unbounded preceding and current row
      )AS RunningReadingCount,
      COUNT(*)
      OVER
      (
        partition by BuildingName, MeterType 
        order by ReadingDate, UtilityReadingID
        rows between
        current row and unbounded following
      )AS RemainingReadingCount
from UtilityReadings
ORDER BY BuildingName, MeterType, ReadingDate, UtilityReadingID;




