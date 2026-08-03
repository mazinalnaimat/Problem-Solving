# Challenge 8: Buildings with multiple meter types only

## Required result

- Remove duplicate building-meter pairs first.
- Return only buildings that have at least two meter types.
- Show both the number of meter types and their alphabetic list.
- Sort by `BuildingName`.

## Table(s)

- `dbo.UtilityReadings`

## Columns to show

- `BuildingName`
- `MeterTypeCount`
- `MeterTypes`

## Skills practiced

- `HAVING` after grouped string aggregation
- Filtering grouped results

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
