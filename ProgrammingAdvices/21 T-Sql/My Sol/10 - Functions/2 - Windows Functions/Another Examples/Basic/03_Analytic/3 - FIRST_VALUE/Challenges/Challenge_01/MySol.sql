USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
      ReadingID,
      MachineCode,
      ReadingTime,
      TemperatureC,
      FIRST_VALUE(TemperatureC)
      OVER
      (
        partition by MachineCode
        order by ReadingTime, ReadingID
        rows between
        unbounded preceding and unbounded following
      )
      AS FirstTempCPerMachineCode
from MachineReadings
order by MachineCode, ReadingTime, ReadingID;


