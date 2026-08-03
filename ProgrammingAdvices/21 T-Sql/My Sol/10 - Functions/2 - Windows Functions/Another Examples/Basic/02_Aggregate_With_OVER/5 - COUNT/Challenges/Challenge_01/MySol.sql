USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      ReadingID,
      MachineCode,
      ProductionLine,
      ReadingTime,
      COUNT(*)
      OVER()
      AS AllMachineReadingsCount
from MachineReadings
ORDER BY ReadingTime, ReadingID;
