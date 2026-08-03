USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      TicketID,
      AgentName,
      OpenedAt,
      ResolutionMinutes,
      FIRST_VALUE(ResolutionMinutes)
      OVER
      (
        partition by AgentName
        order by OpenedAt, TicketID
      )AS FisrtResolutionMinsPerAgent
from SupportTickets
order by AgentName, OpenedAt, TicketID;
