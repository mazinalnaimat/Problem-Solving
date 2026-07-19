# Challenge 2: MIN challenge 2: running delivery history for each driver

## Required result

Return `TripID`, `DriverName`, `Depot`, `DeliveryDate`, `DelayMinutes`, and `RunningMinimumDelay` from `dbo.DeliveryTrips`, with `RunningMinimumDelay` showing the lowest value of `DelayMinutes` for rows that have the same `DriverName`.
Calculate `RunningMinimumDelay` as a running value after ordering each calculation group by `DeliveryDate` and `TripID` in ascending order, starting with the first row and ending at the current row.
Sort the final result by `DriverName`, `DeliveryDate`, and `TripID` in ascending order.

## Table(s)

- `dbo.DeliveryTrips`

## Columns to show

- `TripID`
- `DriverName`
- `Depot`
- `DeliveryDate`
- `DelayMinutes`
- `RunningMinimumDelay`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySol.sql` before checking `Solution.sql`.
