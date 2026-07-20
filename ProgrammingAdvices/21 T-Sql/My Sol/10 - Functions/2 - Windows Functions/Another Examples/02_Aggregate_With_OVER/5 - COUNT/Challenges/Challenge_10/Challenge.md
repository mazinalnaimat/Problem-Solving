# Challenge 10: Delayed-trip percentage for every route

## Required result

- For each depot-and-route combination, count all trips and trips delayed by more than 10 minutes.
- Calculate the delayed percentage as a decimal percentage with two digits after the decimal point.
- Use a CTE so the count aliases can be reused in the percentage expression.
- Sort by `Depot`, `RouteCode`, `DeliveryDate`, and `TripID`.

## Table(s)

- `dbo.DeliveryTrips`

## Columns to show

- `TripID`
- `Depot`
- `RouteCode`
- `DriverName`
- `DelayMinutes`
- `RouteTripCount`
- `DelayedRouteTripCount`
- `DelayedTripPercentage`

## Skills practiced

- Conditional and unconditional window counts
- Reusing window results through a CTE
- Percentage calculation with `NULLIF`

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
