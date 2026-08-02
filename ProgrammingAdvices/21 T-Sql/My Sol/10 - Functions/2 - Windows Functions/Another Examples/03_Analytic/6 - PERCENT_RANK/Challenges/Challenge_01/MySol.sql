USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.



select
      ReadingID,
      MachineCode,
      ReadingTime,
      TemperatureC,
      PERCENT_RANK()
      OVER
      (
        partition by MachineCode
        order by TemperatureC
      )AS TempCPerMachineCodePercentRank
from MachineReadings
where TemperatureC is not null
order by MachineCode, TemperatureC;


