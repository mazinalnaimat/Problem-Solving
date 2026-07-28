USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


with DistinctChannels As 
(
    select distinct SiteName, Channel
    from WebsiteTraffic
)

select 
      SiteName,
      COUNT(*) AS DistinctChannelCount,
      STRING_AGG
      (
        Channel, ', '
      )
      within group (order by Channel)
      AS Channels
from DistinctChannels
group by SiteName
order by SiteName
