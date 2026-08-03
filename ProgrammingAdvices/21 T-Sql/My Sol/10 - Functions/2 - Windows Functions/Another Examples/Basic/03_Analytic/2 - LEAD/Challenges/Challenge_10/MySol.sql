USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select    
	  ResultID,
      TeamName,
      RaceDate,
      Points, 
	  LEAD(Points)
	  OVER
	  (
		partition by TeamName
		order by RaceDate, ResultID
	  )AS NextTeamPoints
from RaceResults
order by TeamName, RaceDate, ResultID;

