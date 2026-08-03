USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      ReadingID,
      MachineCode,
      ProductionLine,
	  CHECKSUM_AGG(ReadingID)
	  OVER
	  (
		partition by ProductionLine
	  ) AS ProductionLineReadingIDCheckSum
from MachineReadings
order by ProductionLine, ReadingID

