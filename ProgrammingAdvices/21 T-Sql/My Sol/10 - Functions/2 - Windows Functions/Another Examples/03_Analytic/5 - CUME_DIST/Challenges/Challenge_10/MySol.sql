USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
      TicketID,
      Priority,
      TeamName,
      SatisfactionScore,
      CUME_DIST()
      OVER
      (
        partition by Priority
        order by SatisfactionScore
      ) AS SatisfactionScorePerPriorityCumeDist
from SupportTickets
where SatisfactionScore is not null
order by Priority, SatisfactionScore;