USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      ResultID,
      AthleteName,
      RaceDate,
      FinishSeconds,
      LAST_VALUE(FinishSeconds)
      OVER
      (
        partition by AthleteName
        order by RaceDate, ResultID
        rows between 
        unbounded preceding and unbounded following
      )
      AS LastFinishSecsPerAthlete
from RaceResults
order by AthleteName, RaceDate, ResultID;


