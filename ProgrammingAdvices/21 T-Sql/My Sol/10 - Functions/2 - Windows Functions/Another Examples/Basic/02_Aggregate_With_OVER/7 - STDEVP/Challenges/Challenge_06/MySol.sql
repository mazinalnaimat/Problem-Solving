USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      ResultID,
      AthleteName,
      TeamName,
      RaceDate,
      Points,
	  STDEVP(Points)
	  OVER
	  (
		partition by AthleteName 
		order by RaceDate, ResultID
		rows between 
		unbounded preceding and current row
	  )
	  AS RunningAthletePointsPopStdDev,
	  STDEVP(Points)
	  OVER
	  (
		partition by TeamName 
		order by RaceDate, ResultID
		rows between 
		unbounded preceding and current row
	  )
	  AS RunningTeamPointsPopStdDev	   
from RaceResults
where Points is not null
order by AthleteName, RaceDate, ResultID


