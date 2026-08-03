USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      TicketID,
      TeamName,
      Priority,
      OpenedAt,
      ResolutionMinutes,
      VAR(ResolutionMinutes)
      OVER
      (
        partition by TeamName, Priority
        order by OpenedAt, TicketID
      )AS RunningResolutionMinPerTeamPrioritySamVar
from SupportTickets
where ResolutionMinutes is not null
order by TeamName, Priority, OpenedAt, TicketID

