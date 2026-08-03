# Challenge 2: AVG challenge 2: running delivery history for each driver

## Required result

Return `TripID`, `DriverName`, `Depot`, `DeliveryDate`, `DelayMinutes`, and `RunningAverageDelay` from `dbo.DeliveryTrips`, with `RunningAverageDelay` showing the average of `DelayMinutes` for rows that have the same `DriverName`.
Calculate `RunningAverageDelay` as a running value after ordering each calculation group by `DeliveryDate` and `TripID` in ascending order, starting with the first row and ending at the current row.
Sort the final result by `DriverName`, `DeliveryDate`, and `TripID` in ascending order.

## Table(s)

- `dbo.DeliveryTrips`

## Columns to show

- `TripID`
- `DriverName`
- `Depot`
- `DeliveryDate`
- `DelayMinutes`
- `RunningAverageDelay`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySol.sql` before checking `Solution.sql`.
