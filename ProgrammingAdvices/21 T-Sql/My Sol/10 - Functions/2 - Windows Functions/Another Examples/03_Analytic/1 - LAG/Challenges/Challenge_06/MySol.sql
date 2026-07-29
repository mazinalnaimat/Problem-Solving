USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
      ResultID,
      AthleteName,
      RaceDate,
      FinishSeconds,
	  LAG(FinishSeconds)
	  OVER
	  (
		partition by AthleteName
		order by RaceDate, ResultID
	  )
	  AS PreviousFinishSecs
from RaceResults
order by AthleteName, RaceDate, ResultID;
