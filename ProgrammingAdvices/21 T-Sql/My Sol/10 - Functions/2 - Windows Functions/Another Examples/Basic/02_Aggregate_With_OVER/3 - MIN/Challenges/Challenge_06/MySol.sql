USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select 
      ResultID,
      AthleteName,
      TeamName,
      RaceDate,
      EventName,
      FinishSeconds,
      MIN(FinishSeconds)
      OVER
      (
        partition by  AthleteName
        order by RaceDate, ResultID
        rows between 
        current row and 2 following
      )
      AS Next3FastestTime
from RaceResults
order by AthleteName, RaceDate, ResultID
