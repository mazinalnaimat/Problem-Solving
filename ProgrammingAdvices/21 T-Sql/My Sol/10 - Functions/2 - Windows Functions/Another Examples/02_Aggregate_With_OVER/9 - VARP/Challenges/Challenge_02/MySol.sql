USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select 
      TripID,
      RouteCode,
      DeliveryDate,
      PackagesDelivered,
      VARP(PackagesDelivered)
      OVER
      (
        partition by RouteCode
        order by DeliveryDate, TripID
        rows between 
        unbounded preceding and current row
      ) AS RunningPackagePerRouteCodePopVar
from DeliveryTrips
order by RouteCode, DeliveryDate, TripID;


