USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
      ReadingID,
      MachineCode,
      ProductionLine,
      OutputUnits,
	  LAST_VALUE(OutputUnits)
	  OVER
	  (
	 	partition by ProductionLine
	 	order by OutputUnits DESC, ReadingID
	 	rows between
	 	unbounded preceding and unbounded following
	  )AS HighestOutputPointsPerProductionLine
from MachineReadings
ORDER BY ProductionLine, OutputUnits DESC, ReadingID;

