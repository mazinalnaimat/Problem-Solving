USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select 
	  EventName,
	  AthleteName,
	  TeamName,
	  FinishSeconds,
	  AVG(FinishSeconds)
	  OVER
	  (
		partition by AthleteName
		order by RaceDate, ResultID
		Rows Between
		current row and 2 following
	  )AS AvgFinishSecondsFor3Next
from RaceResults
ORDER BY AthleteName, RaceDate, ResultID;

