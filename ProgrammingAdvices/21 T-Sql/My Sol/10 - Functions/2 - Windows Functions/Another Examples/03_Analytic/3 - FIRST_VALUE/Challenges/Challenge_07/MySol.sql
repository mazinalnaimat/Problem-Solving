USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      TrafficID,
      SiteName,
      Channel,
      VisitDate,
      Revenue,
      FIRST_VALUE(Revenue)
      OVER
      (
        partition by SiteName, Channel
        order by VisitDate, TrafficID
      )AS FirstRevenuePerSiteChannel
from WebsiteTraffic
order by SiteName, Channel, VisitDate, TrafficID;

