USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      TripID,
      RouteCode,
      DeliveryDate,
      DistanceKm,
      STDEVP(DistanceKm)
      OVER
      (
        partition by RouteCode
        order by DeliveryDate, TripID
        rows between
        unbounded preceding and current row
      )AS RunningDistancePerRoutePopStdDev
from DeliveryTrips
where DistanceKm is not null
order by RouteCode, DeliveryDate, TripID;
