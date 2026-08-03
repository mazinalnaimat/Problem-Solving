USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      ReadingID,
      ReadingTime,
      TemperatureC,
	  STDEV(TemperatureC)
	  OVER
	  (
		order by ReadingTime, ReadingID
		rows between 
		unbounded preceding and current row
	  )AS OverallRunningTemperatureSampleDeviation
from MachineReadings
WHERE TemperatureC IS NOT NULL
ORDER BY ReadingTime, ReadingID;
