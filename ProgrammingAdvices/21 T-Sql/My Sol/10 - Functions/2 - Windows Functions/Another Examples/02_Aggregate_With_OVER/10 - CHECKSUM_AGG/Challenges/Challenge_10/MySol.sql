USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


WITH ClosedTichets AS 
(
    select
          TicketID,
          TeamName,
          ClosedAt,
          CHECKSUM_AGG(TicketID)
          OVER
          (
              partition by TeamName
          ) AS ClosedTicketChecksum
    from SupportTickets
    where ClosedAt is not null
)

select *
from ClosedTichets
order by TeamName, ClosedAt, TicketID

