USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

WITH DailyValues AS 
(
    select
          ProductionLine,
          CAST(ReadingTime AS date) AS ReadingDate,
          AVG(TemperatureC) AS DailyAvgTempC
    from MachineReadings
    group by ProductionLine, CAST(ReadingTime AS date) 
)

Select
      *,
      VAR(DailyAvgTempC)
      OVER
      (
        partition by ProductionLine
        order by ReadingDate
      ) AS RunningDaily_DailyAvgTempC_SamVar
from DailyValues
order by ProductionLine, ReadingDate;

