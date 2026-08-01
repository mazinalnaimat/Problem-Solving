USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.



select 
     TrafficID,
     SiteName,
     Channel,
     Sessions,
     CUME_DIST()
     OVER
     (
        partition by SiteName, Channel
        order by Sessions
     )AS SessionsPerSiteChannelCumeDist
from WebsiteTraffic
where Sessions is not null
order by SiteName, Channel, Sessions;


