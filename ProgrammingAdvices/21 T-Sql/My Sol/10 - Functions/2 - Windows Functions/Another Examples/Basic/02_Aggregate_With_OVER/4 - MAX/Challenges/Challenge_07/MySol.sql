USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.



select
      TrafficID,
      SiteName,
      Channel,
      VisitDate,
      Revenue,
	  MAX(Revenue)
	  OVER
	  (
		partition by SiteName, Channel
	  )AS MaxRevenvuePerSiteChannel

from WebsiteTraffic
ORDER BY SiteName, Channel