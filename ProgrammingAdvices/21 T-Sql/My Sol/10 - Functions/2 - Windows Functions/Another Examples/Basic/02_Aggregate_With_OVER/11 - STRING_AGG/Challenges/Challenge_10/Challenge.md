# Challenge 10: Multiline list of distinct delayed drivers per depot

## Required result

- Use only trips delayed by more than 10 minutes.
- List each driver once per depot.
- Place each driver on a separate line.
- Order driver names alphabetically.

## Table(s)

- `dbo.DeliveryTrips`

## Columns to show

- `Depot`
- `DelayedDrivers`

## Skills practiced

- Using line-break separators
- Filtering and deduplicating before `STRING_AGG`

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
