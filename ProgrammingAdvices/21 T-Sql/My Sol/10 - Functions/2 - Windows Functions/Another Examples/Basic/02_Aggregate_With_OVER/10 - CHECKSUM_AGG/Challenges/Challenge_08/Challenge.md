# Challenge 8: Distinct driver-name checksum per depot using grouped rows

## Required result

- Return one row per depot.
- Convert each driver name to an integer with `CHECKSUM`.
- Use `CHECKSUM_AGG(DISTINCT ...)` so repeated driver names affect the depot checksum once.
- Sort by `Depot`.

## Table(s)

- `dbo.DeliveryTrips`

## Columns to show

- `Depot`
- `DistinctDriverNameChecksum`

## Skills practiced

- Regular grouped `CHECKSUM_AGG`
- `DISTINCT` inside an aggregate without `OVER()`

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
