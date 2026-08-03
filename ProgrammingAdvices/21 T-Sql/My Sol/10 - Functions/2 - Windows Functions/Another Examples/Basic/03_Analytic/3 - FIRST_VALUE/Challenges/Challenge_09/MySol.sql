USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
         ReadingID,
      MachineCode,
      ProductionLine,
      OutputUnits,
      FIRST_VALUE (OutputUnits)
      OVER
      (
        partition by ProductionLine
        order by OutputUnits DESC, ReadingID
      )AS FirstHightOuputPerProductionLine
from MachineReadings
ORDER BY ProductionLine, OutputUnits DESC, ReadingID;


