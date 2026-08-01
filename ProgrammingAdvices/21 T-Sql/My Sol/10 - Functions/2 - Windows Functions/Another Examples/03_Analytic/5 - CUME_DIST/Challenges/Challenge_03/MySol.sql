USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.



select 
      TicketID,
      TeamName,
      AgentName,
      ResolutionMinutes,
      CUME_DIST()
      OVER
      (
        partition by TeamName
        order by ResolutionMinutes
      )AS ResolutionMinsPerTeamCumeDist
from SupportTickets
where ResolutionMinutes is not null
order by TeamName, ResolutionMinutes;
