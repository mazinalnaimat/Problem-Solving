USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      TrafficID,
      SiteName,
      Channel,
      VisitDate,
	  COUNT(*)
	  OVER
	  (
		partition by SiteName
	  )AS SiteRowCount,
	  COUNT(*)
	  OVER
	  (
		partition by SiteName, Channel
	  )AS SiteChannelRowCount
from WebsiteTraffic
ORDER BY SiteName, Channel, VisitDate, TrafficID;

