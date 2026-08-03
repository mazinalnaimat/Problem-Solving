USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select 
      ReadingID,
      MachineCode,
      TemperatureC,
      PERCENTILE_DISC(0.5)
      within Group(order by TemperatureC)
      OVER
      (
        partition by MachineCode
      )AS DiscreteTempCMedian
from MachineReadings
where TemperatureC is not null
order by MachineCode, TemperatureC;



