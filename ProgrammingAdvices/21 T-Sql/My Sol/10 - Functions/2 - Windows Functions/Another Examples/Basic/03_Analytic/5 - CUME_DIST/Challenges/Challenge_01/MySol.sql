USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      ReadingID,
      MachineCode,
      ReadingTime,
      TemperatureC,
      CUME_DIST()
      OVER
      (
        partition by MachineCode
        order by TemperatureC
      )AS TempCPerMachineCodeCumeDist
from MachineReadings
where TemperatureC is not null 
order by MachineCode, TemperatureC;



