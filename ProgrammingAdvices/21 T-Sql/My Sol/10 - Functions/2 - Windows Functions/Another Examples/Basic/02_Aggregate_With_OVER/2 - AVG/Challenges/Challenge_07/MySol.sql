USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select  
	  TrafficId,
	  SiteName,
	  Channel,
	  VisitDate,
	  Conversions,
	  AVG(cast(Conversions as decimal(10, 2)))
	  OVER
	  (
			partition by SiteName, Channel 
	  )AS SiteAndChannelAvgConversions
from WebsiteTraffic
ORDER BY SiteName, Channel;

