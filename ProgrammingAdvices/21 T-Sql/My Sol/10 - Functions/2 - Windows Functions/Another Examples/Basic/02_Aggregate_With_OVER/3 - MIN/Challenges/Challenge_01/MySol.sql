USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
	  ReadingID,
	  MachineCode,
	  ProductionLine,
	  ReadingTime,
	  TemperatureC,
	  MIN(TemperatureC)
	  OVER
	  (
		partition by ProductionLine
	  )
	  AS LineMinTemp
from MachineReadings
order by ProductionLine
