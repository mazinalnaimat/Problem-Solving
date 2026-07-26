USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select 
      ReadingID,
      MachineCode,
      ReadingTime,
      CHECKSUM_AGG(ReadingID)
      OVER
      (
      )AS AllReadingIDCheckSum
from MachineReadings
order by ReadingTime, ReadingID

