# Challenge 10: MAX challenge 10: full delivery route window

## Required result

Return `TripID`, `Depot`, `RouteCode`, `DriverName`, `DeliveryDate`, `DistanceKm`, and `RouteMaximumDistance` from `dbo.DeliveryTrips`, with `RouteMaximumDistance` showing the highest value of `DistanceKm` for rows that have the same `Depot` and `RouteCode`.
Order each calculation group by `DeliveryDate` and `TripID` in ascending order, but calculate `RouteMaximumDistance` using every row in the group from the first row through the last row.
Sort the final result by `Depot`, `RouteCode`, `DeliveryDate`, and `TripID` in ascending order.

## Table(s)

- `dbo.DeliveryTrips`

## Columns to show

- `TripID`
- `Depot`
- `RouteCode`
- `DriverName`
- `DeliveryDate`
- `DistanceKm`
- `RouteMaximumDistance`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySol.sql` before checking `Solution.sql`.
