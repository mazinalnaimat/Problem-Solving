USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
      TicketID,
      TeamName,
      AgentName,
      ResolutionMinutes,
	  PERCENT_RANK()
	  OVER
	  (
		partition by TeamName
		order by ResolutionMinutes
	  )AS ResolutionMinsPerTeamPercentRank
from SupportTickets
where ResolutionMinutes is not null
order by  TeamName, ResolutionMinutes


