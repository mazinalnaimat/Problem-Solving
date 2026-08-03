USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
      ResultID,
      EventName,
      AthleteName,
      FinishSeconds,
      PERCENT_RANK()
      OVER
      (
        partition by EventName
        order by FinishSeconds
      )AS FinishSecsPerEventPercentRank
from RaceResults
where FinishSeconds is not null
order by EventName, FinishSeconds


