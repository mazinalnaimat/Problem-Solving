USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
      TripID,
      DriverName,
      DeliveryDate,
      DelayMinutes,
      STDEV(DelayMinutes)
      OVER
      (
        partition by DriverName
        order by DeliveryDate, TripID
        rows between
        unbounded preceding and current row
      )AS RunningDelaySampleDevByDriver
from DeliveryTrips
WHERE DelayMinutes IS NOT NULL
ORDER BY DriverName, DeliveryDate, TripID;

