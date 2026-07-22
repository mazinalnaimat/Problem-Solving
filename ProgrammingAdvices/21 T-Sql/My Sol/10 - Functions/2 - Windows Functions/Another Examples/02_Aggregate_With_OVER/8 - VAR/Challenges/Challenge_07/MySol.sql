USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.
With RunningStats AS
(
    select
          TrafficID,
          SiteName,
          Channel,
          VisitDate,
          Revenue,
          AVG(Revenue)
          OVER
          (
            partition by SiteName, Channel
            order by VisitDate, TrafficID
          )AS RunningAvgRevenuePerSiteChannel,
          VAR(Revenue)
          OVER
          (
            partition by SiteName, Channel
            order by VisitDate, TrafficID
          )AS RunningRevenuePerSiteChannelSamVar
    from WebsiteTraffic
    where Revenue is not null
)

select 
      *,
      (Revenue - RunningAvgRevenuePerSiteChannel)AS DiffRevenueFromRunningAvg
from RunningStats

order by SiteName, Channel, VisitDate, TrafficID;
