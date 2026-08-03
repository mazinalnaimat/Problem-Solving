USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      TicketID,
      TeamName,
      Priority,
      OpenedAt,
      SatisfactionScore,
      VARP(SatisfactionScore)
      OVER
      (
        Partition by TeamName, Priority
        order by OpenedAt, TicketID
        rows between
        unbounded preceding and current row
      )AS RunningSatisfactionPerTeamPriorityPopVar
from SupportTickets
where SatisfactionScore is not null
order by TeamName, Priority, OpenedAt, TicketID;



