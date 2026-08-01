USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
      TripID,
      Depot,
      DriverName,
      DelayMinutes,
      CUME_DIST()
      OVER
      (
        partition by Depot
        order by DelayMinutes
      )AS DelayMinsPerDepotCumeDist
from DeliveryTrips
where DelayMinutes is not null 
order by Depot, DelayMinutes;


