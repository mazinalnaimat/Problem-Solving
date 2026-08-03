USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      ReadingID,
      ProductionLine,
      OutputUnits,
	  PERCENTILE_CONT(0.70)
	  within group(order by OutputUnits)
	  OVER
	  (
		partition by ProductionLine 
	  )AS P70OuputUnits
from MachineReadings
where OutputUnits is not null
order by ProductionLine, OutputUnits;

