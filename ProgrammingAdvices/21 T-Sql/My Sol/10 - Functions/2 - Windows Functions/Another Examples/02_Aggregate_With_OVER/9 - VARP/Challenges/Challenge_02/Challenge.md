# Challenge 2: Running population variance of packages by route

## Required result

- Restart the running population variance for each `RouteCode`.
- Order rows by `DeliveryDate` and `TripID` inside each group.
- Ignore rows where `PackagesDelivered` is `NULL`.
- Sort by `RouteCode`, `DeliveryDate`, and `TripID`.

## Table(s)

- `dbo.DeliveryTrips`

## Columns to show

- `TripID`
- `RouteCode`
- `DeliveryDate`
- `PackagesDelivered`
- `RunningPackagePopulationVarianceByRouteCode`

## Skills practiced

- Ordered `VARP()` with one partition column
- A deterministic calculation order

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
