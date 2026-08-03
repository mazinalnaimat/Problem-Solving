USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      ResultID,
      AthleteName,
      TeamName,
      RaceDate,
      EventName,
      Points,
      MAX(Points)
      OVER
      (
        partition by AthleteName
        order by RaceDate, ResultID
        rows between
        current row and 2 following 
      )AS MaxPointPerAthleteNext3Results
from RaceResults
ORDER BY AthleteName, RaceDate, ResultID;





