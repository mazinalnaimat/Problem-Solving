USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      ResultID,
      TeamName,
      AthleteName,
      Points,
      LAST_VALUE(Points)
      OVER
      (
        partition by TeamName
        order by Points DESC, ResultID
        rows between 
        unbounded preceding and unbounded following
      )AS LastBestPointsPerTeam
from RaceResults
order BY TeamName, Points DESC, ResultID;

