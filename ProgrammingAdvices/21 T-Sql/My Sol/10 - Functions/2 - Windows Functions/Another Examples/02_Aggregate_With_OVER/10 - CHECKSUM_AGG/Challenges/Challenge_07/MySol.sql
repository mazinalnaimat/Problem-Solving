USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
      TrafficID,
      SiteName,
      Channel,
	  CHECKSUM_AGG(TrafficID)
	  OVER
	  (
		partition by SiteName
	  )AS SiteTrafficChecksum,
	  	  CHECKSUM_AGG(TrafficID)
	  OVER
	  (
		partition by SiteName, Channel
	  )AS SiteChannelTrafficChecksum
from WebsiteTraffic 
order by  SiteName, Channel, VisitDate, TrafficID;


