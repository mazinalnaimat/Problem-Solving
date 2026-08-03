USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      TrafficID,
      SiteName,
      Channel,
      VisitDate,
      Sessions,
      LEAD(Sessions)
      OVER
      (
        partition by SiteName, Channel
        order by VisitDate, TrafficID
      )AS NextWebsiteSessions
from WebsiteTraffic
order by SiteName, Channel, VisitDate, TrafficID;
