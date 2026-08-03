USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.



select
      ReadingID,
      MachineCode,
      ReadingTime,
      TemperatureC,
	  LAG(TemperatureC)
	  OVER
	  (
	        partition by MachineCode
			order by ReadingTime, ReadingID
	  )AS PreviousTempC
from MachineReadings
order by MachineCode, ReadingTime, ReadingID;

