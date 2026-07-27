USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
      EventName,
      STRING_AGG
      (
        Convert
        (
            varchar(max),
            Concat(AthleteName, ' - ', FinishSeconds)
        ),
        ' | '
      )
      within group(order by FinishSeconds, ResultID)
      AS Leaderboard
from RaceResults
group by EventName
order by EventName

