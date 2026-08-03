USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      TicketID,
      AgentName,
      OpenedAt,
      ResolutionMinutes,
      LEAD(ResolutionMinutes)
      OVER
      (
        partition by AgentName
        order by OpenedAt, TicketID
      )
      AS NextTicketResolutionMins
from SupportTickets
order by AgentName, OpenedAt, TicketID;


