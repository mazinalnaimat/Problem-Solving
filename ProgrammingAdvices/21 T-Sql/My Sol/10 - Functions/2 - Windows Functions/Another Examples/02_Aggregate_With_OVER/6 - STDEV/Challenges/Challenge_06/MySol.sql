USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.



select
      ResultID,
      AthleteName,
      TeamName,
      RaceDate,
      FinishSeconds,
	  STDEV(FinishSeconds)
	  OVER
	  (
		partition by AthleteName
		order by RaceDate, ResultID
		rows between 
		unbounded preceding and current row
	  ) as AthleteRunningFinishSecSampleDev,
	  
	  STDEV(FinishSeconds)
	  OVER
	  (
		partition by TeamName
		order by RaceDate, ResultID
		rows between 
		unbounded preceding and current row
	  ) as TeamRunningFinishSecSampleDev
from RaceResults
WHERE FinishSeconds IS NOT NULL
ORDER BY AthleteName, RaceDate, ResultID;

