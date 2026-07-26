USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      UtilityReadingID,
      BuildingName,
      MeterType,
      CHECKSUM_AGG(UtilityReadingID)
      OVER
      (
        partition by BuildingName, MeterType 
      )AS BuildingMeterTypeReadingChecksum,
      CHECKSUM_AGG(UtilityReadingID)
      OVER
      (
      )AS AllUtilityReadingChecksum
from UtilityReadings
order by BuildingName, MeterType, ReadingDate, UtilityReadingID;

