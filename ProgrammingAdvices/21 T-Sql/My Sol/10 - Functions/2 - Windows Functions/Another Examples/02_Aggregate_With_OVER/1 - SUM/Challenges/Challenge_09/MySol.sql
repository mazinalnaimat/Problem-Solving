USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select 
	  ReadingID,
	  MachineCode,
	  ReadingTime,
	  OutputUnits,
	  SUM(OutputUnits)
	  OVER
	  (
		partition by MachineCode
		order by ReadingTime, ReadingID
		rows between 
		1 preceding and current row 
	  )AS TotalOutputUnitsOfLast2Readings	  
from MachineReadings
order by MachineCode, ReadingTime, ReadingID;
