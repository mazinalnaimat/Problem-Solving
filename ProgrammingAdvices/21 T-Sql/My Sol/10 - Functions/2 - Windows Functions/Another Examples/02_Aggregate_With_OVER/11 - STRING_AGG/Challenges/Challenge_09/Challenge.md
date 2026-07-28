# Challenge 9: Route-and-trip-count summaries per depot

## Required result

- First count trips for each depot-and-route combination.
- Format each route item as `RouteCode (N trips)`.
- Join route items with `; ` and order them by route code.
- Return one row per depot.

## Table(s)

- `dbo.DeliveryTrips`

## Columns to show

- `Depot`
- `RouteSummary`

## Skills practiced

- Two-stage aggregation
- Aggregating pre-grouped summary rows

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
