USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      TicketID,
      AgentName,
      OpenedAt,
      ResolutionMinutes,
	  LAG(ResolutionMinutes)
	  OVER
	  (
		partition by AgentName 
		order by OpenedAt, TicketID
	  )
	  AS PreviousTicektResolution
from SupportTickets
order by AgentName, OpenedAt, TicketID;


