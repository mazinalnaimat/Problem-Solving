USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
		*,
		SUM(Points)
		OVER
		(
			partition by AthleteName
			order by RaceDate, ResultID
			ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING
		) AS NextThreeRacePoints
from RaceResults
