USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select 
      TripID,
      Depot,
      DelayMinutes,
      PERCENTILE_CONT(0.75)
      within group(order by DelayMinutes)
      OVER
      (
        partition by Depot
      )AS P75DelayMinutes
from DeliveryTrips
where DelayMinutes is not null
order by Depot, DelayMinutes;

