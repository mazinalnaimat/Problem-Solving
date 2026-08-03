USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
      TicketID,
      TeamName,
      ResolutionMinutes,
      PERCENTILE_DISC(0.60)
      within group(order by ResolutionMinutes)
      OVER
      (
        partition by TeamName
      )AS  DiscreteP60ResolutionMins
from SupportTickets
where ResolutionMinutes is not null
order by TeamName, ResolutionMinutes;
