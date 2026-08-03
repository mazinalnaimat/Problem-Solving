USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      ReadingID,
      MachineCode,
      ReadingTime,
      VibrationMmS,
      MIN(VibrationMmS)
      OVER
      (
        partition by MachineCode
        order by ReadingTime, ReadingID
        rows between 
        1 preceding and current row
      )AS Last2ReadingMinVibration
from MachineReadings
ORDER BY MachineCode, ReadingTime, ReadingID
