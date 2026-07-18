USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
      *,
      SUM(Cost)
      OVER
      (
        partition by BuildingName, MeterType
        order by ReadingDate, UtilityReadingID
        Rows Between
        unbounded preceding and current row 
      ) As RunningUtilityCost
from UtilityReadings
order by BuildingName, MeterType, ReadingDate, UtilityReadingID
