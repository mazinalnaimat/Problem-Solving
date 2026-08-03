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
          Revenue,
          AVG(Revenue)
          OVER
          (
            partition by SiteName, Channel
            order by VisitDate, TrafficID
            rows between
            unbounded preceding and current row
          )AS RunningAvgRevenue,
          STDEV(Revenue)
          OVER
          (
            partition by SiteName, Channel
            order by VisitDate, TrafficID
            rows between
            unbounded preceding and current row
          )AS RunningRevenueSampleDev
    from WebsiteTraffic
    WHERE Revenue IS NOT NULL
)

select 
      *,
      CAST(Revenue - RunningAvgRevenue AS decimal(18, 4)) AS DifffromRunningAvg
from RunningStats 
ORDER BY SiteName, Channel, VisitDate, TrafficID;


