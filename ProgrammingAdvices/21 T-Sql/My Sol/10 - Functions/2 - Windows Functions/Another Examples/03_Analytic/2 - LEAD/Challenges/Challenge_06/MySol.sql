USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      ResultID,
      AthleteName,
      RaceDate,
      FinishSeconds,
      LEAD(FinishSeconds)
      OVER
      (
        partition by AthleteName
        order by RaceDate, ResultID
      )
      AS NextFinishSecs
from RaceResults
order by AthleteName, RaceDate, ResultID;

