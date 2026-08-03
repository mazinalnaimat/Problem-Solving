USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.



select 
      TicketID,
      Priority,
      TeamName,
      SatisfactionScore,
	  PERCENT_RANK()
	  OVER
	  (
		partition by Priority
		order by SatisfactionScore
	  )AS SatisScorePerPrioriyPercentRank
from SupportTickets
where SatisfactionScore is not null
order by  Priority, SatisfactionScore
