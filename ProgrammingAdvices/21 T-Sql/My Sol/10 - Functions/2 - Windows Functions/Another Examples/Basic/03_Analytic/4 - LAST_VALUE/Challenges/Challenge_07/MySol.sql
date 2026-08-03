USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      TrafficID,
      SiteName,
      Channel,
      VisitDate,
      Revenue,
      LAST_VALUE(Revenue)
      OVER
      (
        partition by SiteName, Channel
        order by VisitDate, TrafficID
        rows between 
        unbounded preceding and unbounded following
      )AS LastRevenuePerSiteChannel
from WebsiteTraffic
order by SiteName, Channel, VisitDate, TrafficID;

