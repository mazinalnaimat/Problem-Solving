USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select 
      ResultID,
      EventName,
      AthleteName,
      TeamName,
      Points,
      CHECKSUM_AGG
      (
        CHECKSUM(AthleteName, TeamName, Points)
      )
      OVER
      (
        partition by EventName
      )AS EventResultDataCheckSum
from RaceResults
order by EventName, RaceDate, ResultID;

