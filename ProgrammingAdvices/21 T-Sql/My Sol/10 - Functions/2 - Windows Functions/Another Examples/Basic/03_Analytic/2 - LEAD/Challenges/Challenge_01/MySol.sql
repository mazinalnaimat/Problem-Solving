USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
      ReadingID,
      MachineCode,
      ReadingTime,
      TemperatureC,
      LEAD(TemperatureC)
      OVER
      (
        partition by MachineCode
        order by ReadingTime, ReadingID
      )AS NextTempC
from MachineReadings
order by MachineCode, ReadingTime, ReadingID;



