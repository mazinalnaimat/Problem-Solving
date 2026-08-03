USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
      ResultID,
      TeamName,
      AthleteName,
      Points,
	  FIRST_VALUE(Points)
	  OVER
	  (
		partition by TeamName
		order by Points DESC, ResultID
		rows between
		unbounded preceding and unbounded following 
	  )AS FirstRacePointsPerTeam
from RaceResults
order by TeamName, Points DESC, ResultID;


