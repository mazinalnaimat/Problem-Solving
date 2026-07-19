# Challenge 2: MAX challenge 2: running delivery history for each driver

## Required result

Return `TripID`, `DriverName`, `Depot`, `DeliveryDate`, `PackagesDelivered`, and `RunningMaximumPackages` from `dbo.DeliveryTrips`, with `RunningMaximumPackages` showing the highest value of `PackagesDelivered` for rows that have the same `DriverName`.
Calculate `RunningMaximumPackages` as a running value after ordering each calculation group by `DeliveryDate` and `TripID` in ascending order, starting with the first row and ending at the current row.
Sort the final result by `DriverName`, `DeliveryDate`, and `TripID` in ascending order.

## Table(s)

- `dbo.DeliveryTrips`

## Columns to show

- `TripID`
- `DriverName`
- `Depot`
- `DeliveryDate`
- `PackagesDelivered`
- `RunningMaximumPackages`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySol.sql` before checking `Solution.sql`.
