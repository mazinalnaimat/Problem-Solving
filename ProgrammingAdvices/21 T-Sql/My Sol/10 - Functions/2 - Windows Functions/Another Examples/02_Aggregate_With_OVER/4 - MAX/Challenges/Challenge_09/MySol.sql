USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.



select 
      ReadingID,
      MachineCode,
      ReadingTime,
      DefectCount,
	  MAX(DefectCount)
	  OVER
	  (
		partition by MachineCode
		order by ReadingTime, ReadingID
		rows between 
		1 preceding and current row
	  )AS MaxDefectCountPerMachineCodeLast2Readings
from MachineReadings
ORDER BY MachineCode, ReadingTime, ReadingID

