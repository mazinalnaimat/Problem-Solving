# Challenge 2: Distinct route codes listed per depot

## Required result

- Return one row per depot.
- List each distinct route code once.
- Separate values with `, ` and order them by route code.
- Sort the final rows by `Depot`.

## Table(s)

- `dbo.DeliveryTrips`

## Columns to show

- `Depot`
- `RouteCodes`

## Skills practiced

- Grouped `STRING_AGG`
- Ordering values with `WITHIN GROUP`

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
