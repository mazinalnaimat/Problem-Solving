USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      ReadingID,
      MachineCode,
      ReadingTime,
      DefectCount,
	  LAG(DefectCount, 2, 0)
	  OVER
	  (
		partition by MachineCode
		order by ReadingTime, ReadingID
	  )AS PreviousDefectCount
from MachineReadings
order by  MachineCode, ReadingTime, ReadingID;

