USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select 
      TicketID,
      TeamName,
      Priority,
      OpenedAt,
      ResolutionMinutes,
      STDEV(ResolutionMinutes)
      OVER
      (
        partition by TeamName
        order by OpenedAt, TicketID
      )AS RunningResolutionSampleDevByTeam
from SupportTickets
WHERE ResolutionMinutes IS NOT NULL
ORDER BY TeamName,  OpenedAt, TicketID;

