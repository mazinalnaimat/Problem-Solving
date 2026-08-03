USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
      TicketID,
      Priority,
      SatisfactionScore,
      PERCENTILE_CONT(0.50)
      within group (order by SatisfactionScore)
      OVER
      (
        partition by Priority 
      )As SatisfactionScoreMedian
from SupportTickets
where SatisfactionScore is not null
order by Priority, SatisfactionScore;


