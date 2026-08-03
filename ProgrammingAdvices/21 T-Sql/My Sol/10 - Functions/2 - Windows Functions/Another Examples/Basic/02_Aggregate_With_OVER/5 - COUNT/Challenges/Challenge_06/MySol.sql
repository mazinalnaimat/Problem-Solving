USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      ResultID,
      EventName,
      AthleteName,
      RaceDate,
      COUNT(*)
      OVER
      (
        partition by EventName
        order by RaceDate, ResultID
        rows between 
        1 preceding and 1 following
      )AS CenteredResultCount
from RaceResults
ORDER BY EventName, RaceDate, ResultID;

