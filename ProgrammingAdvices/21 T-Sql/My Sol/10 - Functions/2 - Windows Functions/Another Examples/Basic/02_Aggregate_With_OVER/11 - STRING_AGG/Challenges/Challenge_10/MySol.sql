USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

with DelayedDriver as
(
    select distinct
          Depot, DriverName
    from DeliveryTrips
    where DelayMinutes > 10
)

select 
      Depot,
      STRING_AGG(DriverName, ', ')
      within group (order by DriverName)
      AS DelayedDrivers
from DelayedDriver
group by Depot
order by Depot