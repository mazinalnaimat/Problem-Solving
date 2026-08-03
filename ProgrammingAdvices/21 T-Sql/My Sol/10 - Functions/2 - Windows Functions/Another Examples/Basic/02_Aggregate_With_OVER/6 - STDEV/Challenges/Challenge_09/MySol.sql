USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

With DailyValues as
(
    select 
	      ProductionLine,
          CAST(ReadingTime AS date) AS ReadingDate,
          AVG(CAST(DefectCount AS decimal(10,2))) AS DailyAverageDefectCount
    from MachineReadings
    WHERE DefectCount IS NOT NULL
    group by ProductionLine, CAST(ReadingTime AS date)
)

select 
     *,
     STDEV(DailyAverageDefectCount)
     OVER
     (
       partition by ProductionLine
       order by ReadingDate
     ) AS RunningDailyDefectSampleDev
from DailyValues

