USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      ResultID,
      AthleteName,
      RaceDate,
      FinishSeconds,
      FIRST_VALUE(FinishSeconds)
      OVER
      (
         partition by AthleteName
         order by RaceDate, ResultID
      )AS FirstFinishSecsPerAthlete
from RaceResults
order by AthleteName, RaceDate, ResultID;
