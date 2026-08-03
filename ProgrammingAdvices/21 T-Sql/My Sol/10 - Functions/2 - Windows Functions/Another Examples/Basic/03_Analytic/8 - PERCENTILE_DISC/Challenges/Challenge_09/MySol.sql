USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      ReadingID,
      ProductionLine,
      OutputUnits,
	  PERCENTILE_DISC(0.70)
	  within group(order by OutputUnits)
	  OVER
	  (
		partition by ProductionLine 
	  )AS DisceteP70OuputUnits
from MachineReadings
where OutputUnits is not null
order by ProductionLine, OutputUnits;

