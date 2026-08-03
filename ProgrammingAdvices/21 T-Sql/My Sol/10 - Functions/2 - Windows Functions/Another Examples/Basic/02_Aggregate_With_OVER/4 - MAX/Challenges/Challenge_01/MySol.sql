USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select 
      ReadingID,
      MachineCode,
      ProductionLine,
      ReadingTime,
      VibrationMmS,
	  MAX(VibrationMmS)
	  OVER
	  (
		partition by ProductionLine
	  )AS MaxVibrationsPerProductionLine
from MachineReadings
ORDER BY ProductionLine
