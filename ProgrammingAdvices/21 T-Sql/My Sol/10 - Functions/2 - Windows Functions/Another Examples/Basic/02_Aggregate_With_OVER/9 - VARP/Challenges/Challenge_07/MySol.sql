USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

WITH RunningStats AS 
(
	select 
	      TrafficID,
          SiteName,
          Channel,
          VisitDate,
          Conversions,
          AVG(Conversions)
		  OVER
		  (
			partition by SiteName, Channel
			order by VisitDate, TrafficID
		  ) AS RunningAvgConversionPerSiteChannel,
		  VARP(Conversions)
		  OVER
		  (
			partition by SiteName, Channel
			order by VisitDate, TrafficID
		  ) AS RunningConversionPerSiteChannelPopVar
	from WebsiteTraffic
	where Conversions is not null
)

select 
     *,
	 (Conversions - RunningAvgConversionPerSiteChannel) AS DiffConversionFromRunningAvg
from RunningStats
order by SiteName, Channel, VisitDate, TrafficID;

