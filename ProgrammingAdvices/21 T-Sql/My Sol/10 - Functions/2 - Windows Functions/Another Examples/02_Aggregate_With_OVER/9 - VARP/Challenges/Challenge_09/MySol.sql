USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

With DailyValues AS 
(
	select 
	       ProductionLine,
          CAST(ReadingTime AS date) AS ReadingDate,
	      AVG(VibrationMmS) AS DailyAvgVibrationMmSPerProductionLine
	from MachineReadings
	where VibrationMmS is not null
	group by 
			ProductionLine,
			CAST( ReadingTime AS DATE)
)

select *,
       VARP(DailyAvgVibrationMmSPerProductionLine)
	   OVER
	   (
          partition by ProductionLine
          order by ReadingDate
      ) AS RunningDaily_DailyAvgVibrationMmSPerProductionLine_PopVar
from DailyValues
order by ProductionLine, ReadingDate;

