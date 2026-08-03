# Challenge 8: Filter machines by a window count using a CTE

## Required result

- Calculate the total number of readings for each machine.
- Return only machines that have at least three readings.
- Do not place the window function directly in the `WHERE` clause.
- Sort by `MachineCode`, `ReadingTime`, and `ReadingID`.

## Table(s)

- `dbo.MachineReadings`

## Columns to show

- `ReadingID`
- `MachineCode`
- `ReadingTime`
- `MachineReadingCount`

## Skills practiced

- Filtering a window result in an outer query
- CTE-based window-function workflow

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
