USE WindowFunctionsTrainingDB;
GO

-- Write your solution below..
With DailyValues AS
(
    select
          ProductionLine,
          CAST(ReadingTime AS date) AS ReadingDate,
          AVG
          (
            CAST(DefectCount AS decimal(10,2))
          ) AS DailyAverageDefectCount
    from MachineReadings
    where DefectCount is not null
    group by ProductionLine, CAST(ReadingTime AS date)
)
select 
      *,
      STDEVP(DailyAverageDefectCount)
      OVER
      (
        partition by ProductionLine
        order by ReadingDate
      )AS RunningDaily_DailyAvgDefectCount_PopStdDev
from DailyValues
order by ProductionLine, ReadingDate;
