USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
     TicketID,
     TeamName,
     Priority,
     CHECKSUM_AGG(TicketID)
     OVER
     (
        partition by TeamName 
     )AS TeamTicketCheckSum,
     CHECKSUM_AGG(TicketID)
     OVER
     (
        partition by TeamName, Priority
     )AS TeamPriorityTickectCheckSum
from SupportTickets
order by TeamName, Priority, TicketID;


