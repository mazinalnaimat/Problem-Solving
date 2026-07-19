USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      TripID,
      DriverName,
      Depot,
      DeliveryDate,
      DelayMinutes,
      MIN(DelayMinutes)
      OVER
      (
       partition by DriverName
       order by DeliveryDate, TripID
       rows between 
       unbounded preceding and current row
      )
      AS RunningMinDelay

from DeliveryTrips
order by DriverName, DeliveryDate, TripID;
