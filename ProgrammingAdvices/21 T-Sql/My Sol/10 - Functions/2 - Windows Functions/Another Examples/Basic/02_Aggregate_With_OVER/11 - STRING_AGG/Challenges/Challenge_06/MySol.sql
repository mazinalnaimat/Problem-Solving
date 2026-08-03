USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
	   TeamName,
	   STRING_AGG
	   (
			CONCAT('[', Priority, '] ', TicketTitle),
			', '
	   )
	   within group (order by OpenedAt, TicketID)
	   AS OpenTicketSummary
from SupportTickets
where ClosedAt is null
group by TeamName
order by TeamName

