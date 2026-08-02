USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.



select
      TrafficID,
      SiteName,
      Channel,
      Sessions,
      PERCENT_RANK()
      OVER
      (
        partition by SiteName, Channel
        order by Sessions
      )AS SessoinsPerSiteChannelPercentRank
from WebsiteTraffic
where Sessions is not null
order by SiteName, Channel, Sessions;
