USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      TripID,
      DriverName,
      DeliveryDate,
      DelayMinutes,
      FIRST_VALUE(DelayMinutes)
      OVER
      (
        partition by DriverName
        order by DeliveryDate, TripID
        rows between
        unbounded preceding and unbounded following
      )AS FirstDelayPerDriverName
from DeliveryTrips
order by DriverName, DeliveryDate, TripID;
