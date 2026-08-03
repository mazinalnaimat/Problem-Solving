USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select 
      ReadingID,
      ReadingTime,
      OutputUnits,
      VAR(OutputUnits)
      OVER
      (
        order by ReadingTime, ReadingID
      )AS OverallRunningOuputUnitsSamVar
from MachineReadings
where OutputUnits is not null
order by ReadingTime, ReadingID

