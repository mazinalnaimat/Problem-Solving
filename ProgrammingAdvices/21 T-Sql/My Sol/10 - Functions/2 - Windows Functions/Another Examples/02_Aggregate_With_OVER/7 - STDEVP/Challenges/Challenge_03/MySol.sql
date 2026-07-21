USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      TicketID,
      TeamName,
      Priority,
      OpenedAt,
      SatisfactionScore,
	  STDEVP(SatisfactionScore)
	  OVER
	  (
		partition by TeamName, Priority
		order by OpenedAt, TicketID
		rows between 
		unbounded preceding and current row
	  ) AS RunningSatisfactionPerTeamPriorityPopStdDev
from SupportTickets
where SatisfactionScore is not null 
order by TeamName, Priority, OpenedAt, TicketID;


