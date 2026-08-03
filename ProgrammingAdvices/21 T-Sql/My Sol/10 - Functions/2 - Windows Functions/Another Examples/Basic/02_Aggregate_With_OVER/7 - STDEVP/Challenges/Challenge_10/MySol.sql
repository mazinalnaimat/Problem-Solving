USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

WITH OverallStats AS
(
	select 
		  EventName,
		  STDEVP(FinishSeconds)
		  AS OverallFinishPopStdDev
	from RaceResults
	where FinishSeconds IS NOT NULL
	group by EventName
)
select 
      RR.ResultID,
      RR.EventName,
      RR.RaceDate,
      RR.FinishSeconds,
      OS.OverallFinishPopStdDev,
      STDEVP(RR.FinishSeconds)
      OVER
      (
          partition by RR.EventName
          order by RR.RaceDate, RR.ResultID
      ) AS RunningFinishPerEventPopStdDev
from OverallStats AS OS
join RaceResults As RR
on OS.EventName = RR.EventName
where RR.FinishSeconds is not null
order by RR.EventName, RR.RaceDate, RR.ResultID;