USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select 
      ReadingID,
      MachineCode,
      ReadingTime,
      VibrationMmS,
      AVG(VibrationMmS)
      OVER
      (
        partition by MachineCode
        order by ReadingTime, ReadingID
        rows between
        1 preceding and current row
      )AS TwoReadingAverageVibration
from MachineReadings
order by MachineCode, ReadingTime, ReadingID