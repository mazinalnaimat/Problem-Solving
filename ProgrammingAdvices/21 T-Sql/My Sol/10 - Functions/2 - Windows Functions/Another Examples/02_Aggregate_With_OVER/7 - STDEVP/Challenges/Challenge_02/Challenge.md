# Challenge 2: Running population deviation of distance by route

## Required result

- Restart the running population standard deviation for each `RouteCode`.
- Order rows by `DeliveryDate` and `TripID` inside each group.
- Ignore rows where `DistanceKm` is `NULL`.
- Sort by `RouteCode`, `DeliveryDate`, and `TripID`.

## Table(s)

- `dbo.DeliveryTrips`

## Columns to show

- `TripID`
- `RouteCode`
- `DeliveryDate`
- `DistanceKm`
- `RunningDistancePopulationDeviationByRouteCode`

## Skills practiced

- Ordered `STDEVP()` with one partition column
- A deterministic calculation order

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
