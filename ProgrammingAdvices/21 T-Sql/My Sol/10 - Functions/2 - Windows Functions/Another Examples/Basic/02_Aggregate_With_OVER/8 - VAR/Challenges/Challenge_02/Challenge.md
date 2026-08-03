# Challenge 2: Running sample variance of fuel by driver

## Required result

- Restart the running sample variance for each `DriverName`.
- Order rows by `DeliveryDate` and `TripID` inside each group.
- Ignore rows where `FuelLiters` is `NULL`.
- Sort by `DriverName`, `DeliveryDate`, and `TripID`.

## Table(s)

- `dbo.DeliveryTrips`

## Columns to show

- `TripID`
- `DriverName`
- `DeliveryDate`
- `FuelLiters`
- `RunningFuelSampleVarianceByDriverName`

## Skills practiced

- Ordered `VAR()` with one partition column
- A deterministic calculation order

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
