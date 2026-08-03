USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      ResultID,
      TeamName,
      RaceDate,
      Points,
	  LAG(Points)
	  OVER
	  (
		partition by TeamName
		order by RaceDate, ResultID
	  )AS PreviousPoints
from RaceResults
order by TeamName, RaceDate, ResultID;

