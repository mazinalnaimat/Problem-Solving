USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select 
      ReadingID,
      MachineCode,
      TemperatureC,
      PERCENTILE_CONT(0.5)
      within Group(order by TemperatureC)
      OVER
      (
        partition by MachineCode
      )AS TempCMedian
from MachineReadings
where TemperatureC is not null
order by MachineCode, TemperatureC;



