USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.



select
      ResultID,
      EventName,
      FinishSeconds,
	  PERCENTILE_CONT(0.25)
	  within group (order by FinishSeconds)
	  OVER
	  (
		partition by EventName
	  )
	  AS P25FinishSecs
from RaceResults
where FinishSeconds is not null
order by EventName, FinishSeconds;


