USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

WITH ProdcLineStats AS
(
    select
          ProductionLine,
          STDEV(OutputUnits) AS OutputPointsPerProdLineSampleDev 
    from MachineReadings
    where OutputUnits is not null
    group by ProductionLine
)

select
      MR.ReadingID,
      MR.ProductionLine,
      MR.ReadingTime,
      MR.OutputUnits,
      PLS.OutputPointsPerProdLineSampleDev,
      STDEV(OutputUnits)
      OVER
      (
        partition by MR.ProductionLine
        order by MR.ReadingTime, MR.ReadingID
      ) as RunningOutputUnitPerProdLineSampleDev
from ProdcLineStats AS PLS
join MachineReadings MR
on PLS.ProductionLine = MR.ProductionLine
where MR.OutputUnits is not null
ORDER BY MR.ProductionLine, MR.ReadingTime, MR.ReadingID


