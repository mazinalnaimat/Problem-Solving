USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
      TrafficID,
      SiteName,
      Channel,
      VisitDate,
      Sessions,
      MIN(Sessions)
      OVER
      (
	      partition by SiteName, Channel 
      )AS SiteChannelMinSessions
from WebsiteTraffic
ORDER BY SiteName, Channel
