USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      ReadingID,
      MachineCode,
      ReadingTime,
      DefectCount,
      LEAD(DefectCount, 2, 0)
      OVER
      (
        partition by MachineCode
        order by ReadingTime, ReadingID
      )AS NextBy2MachineDefect
from MachineReadings
