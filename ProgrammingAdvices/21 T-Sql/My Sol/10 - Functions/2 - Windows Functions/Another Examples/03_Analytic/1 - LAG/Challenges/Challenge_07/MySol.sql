USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      TrafficID,
      SiteName,
      Channel,
      VisitDate,
      Sessions,
	  LAG(Sessions)
	  OVER
	  (
		partition by SiteName, Channel
		order by VisitDate, TrafficID
	  )AS PreviousRevenue
from WebsiteTraffic
order by SiteName, Channel, VisitDate, TrafficID;

