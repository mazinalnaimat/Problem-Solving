USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select 
      Depot,
      CHECKSUM_AGG  
      (
        DISTINCT CHECKSUM(DriverName)
      ) 
      DistinctDriverNameChecksum
from DeliveryTrips
group by Depot
order by Depot
