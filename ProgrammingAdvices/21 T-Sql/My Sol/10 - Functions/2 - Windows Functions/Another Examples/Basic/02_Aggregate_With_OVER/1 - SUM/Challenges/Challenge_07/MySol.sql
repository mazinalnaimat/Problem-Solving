USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.




select 
	  *,
	  SUM(Revenue)
	  OVER
	  (
		partition by SiteName, Channel
	  ) AS TotalRevenuePerSiteNameAndChannel
from WebsiteTraffic
ORDER BY SiteName, Channel;

