USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select 
      TripID,
      Depot,
      DelayMinutes,
      PERCENTILE_DISC(0.75)
      within group(order by DelayMinutes)
      OVER
      (
        partition by Depot
      )AS DiscreteP75DelayMinutes
from DeliveryTrips
where DelayMinutes is not null
order by Depot, DelayMinutes;

