USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      ResultID,
      AthleteName,
      TeamName,
      RaceDate,
      FinishSeconds,
      VAR(FinishSeconds)
      OVER
      (
        partition by AthleteName
        order by RaceDate, ResultID
      )AS RunningFinishSecPerAthleteSamVar,
      VAR(FinishSeconds)
      OVER
      (
        partition by TeamName
        order by RaceDate, ResultID
      )AS RunningFinishSecPerNameSamVar
from RaceResults
where FinishSeconds is not null
order by AthleteName, RaceDate, ResultID;

