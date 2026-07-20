# Challenge 2: Running trip count for each driver

## Required result

- Restart the count for each driver.
- Count from the driver’s first trip through the current trip.
- Use `DeliveryDate` and `TripID` to create a deterministic calculation order.
- Sort by `DriverName`, `DeliveryDate`, and `TripID`.

## Table(s)

- `dbo.DeliveryTrips`

## Columns to show

- `TripID`
- `DriverName`
- `Depot`
- `DeliveryDate`
- `RunningTripCount`

## Skills practiced

- `PARTITION BY` with a running frame
- `ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW`

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
