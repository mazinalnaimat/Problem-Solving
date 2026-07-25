USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
      ResultID,
      AthleteName,
      EventName,
      RaceDate,
      FinishSeconds,
      VARP(FinishSeconds)
      OVER
      (
        partition by AthleteName
        order by RaceDate, ResultID
      ) AS RunningFinishSecPerAthletePopVar,
       VARP(FinishSeconds)
      OVER
      (
        partition by EventName
        order by RaceDate, ResultID
      ) AS RunningFinishSecPerEventPopVar
from RaceResults 
where FinishSeconds is not null
order by AthleteName, RaceDate, ResultID;
