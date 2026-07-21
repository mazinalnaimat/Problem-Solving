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
            rows between 
            unbounded preceding and current row
          )AS RunningAvgSiteChennalRevenue,
          STDEVP(Revenue)
          OVER
          (
            partition by SiteName, Channel
            order by VisitDate, TrafficID
            rows between 
            unbounded preceding and current row
          )AS RunningSiteChennalRevenuePopStdDev
    from WebsiteTraffic
    where Revenue is not null
)

select
      *,
      ( Revenue - RunningAvgSiteChennalRevenue)AS DiffRevenuefromRunningAvg
from RunningStats 
order by SiteName, Channel, VisitDate, TrafficID;
