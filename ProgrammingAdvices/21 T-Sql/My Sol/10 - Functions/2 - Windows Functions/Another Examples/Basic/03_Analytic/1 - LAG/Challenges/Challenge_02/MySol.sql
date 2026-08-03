USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      TripID,
      DriverName,
      DeliveryDate,
      DelayMinutes,
      LAG(DelayMinutes)
      OVER
      (
        partition by DriverName
        order by DeliveryDate, TripID
      )
      AS PreviousDeliveryDelay
from DeliveryTrips
order by DriverName, DeliveryDate, TripID;

