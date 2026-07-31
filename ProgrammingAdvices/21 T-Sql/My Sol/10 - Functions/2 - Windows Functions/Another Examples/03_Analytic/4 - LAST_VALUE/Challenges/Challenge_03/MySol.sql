USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.




select
     TicketID,
     AgentName,
     OpenedAt,
     ResolutionMinutes,
	 LAST_VALUE(ResolutionMinutes)
	 OVER
	 (
	  partition by AgentName
	  order by OpenedAt, TicketID
	  rows between 
	  unbounded preceding and unbounded following
	 )AS LastResolutionMinPerAgent
from SupportTickets
order by  AgentName, OpenedAt, TicketID;
