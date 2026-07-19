USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      TicketID,
      AgentName,
      TeamName,
      OpenedAt,
      ResolutionMinutes,
      MIN(ResolutionMinutes)
      OVER
      (
        partition by AgentName
        order by OpenedAt, TicketID
        rows between 
        2 preceding and current row
      )
      AS MovingMinResolution
from SupportTickets
order by AgentName, OpenedAt, TicketID 
