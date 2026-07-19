USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      TicketID,
      AgentName,
      TeamName,
      OpenedAt,
      ResolutionMinutes,
      MAX(ResolutionMinutes)
      OVER
      (
        partition by AgentName
        order by OpenedAt, TicketID
        rows between
        2 preceding and current row
      )AS MaxResulutionPerAgent3LastResulution
from SupportTickets
ORDER BY AgentName, OpenedAt, TicketID;




