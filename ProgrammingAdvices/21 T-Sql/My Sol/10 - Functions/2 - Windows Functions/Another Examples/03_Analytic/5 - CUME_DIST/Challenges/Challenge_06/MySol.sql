USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
      ResultID,
      EventName,
      AthleteName,
      FinishSeconds,
      CUME_DIST()
      OVER
      (
        partition by EventName
        order by FinishSeconds
      )AS FinishSecsPerEventCumeDist
from RaceResults
where FinishSeconds is not null
order by  EventName, FinishSeconds;
