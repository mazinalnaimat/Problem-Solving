# Challenge 1: Overall machine-reading count without partitioning

## Required result

- Return every machine-reading detail row.
- `AllReadingCount` must show the number of all rows returned by the query.
- Do not use `PARTITION BY` inside the window.
- Sort by `ReadingTime`, then `ReadingID`.

## Table(s)

- `dbo.MachineReadings`

## Columns to show

- `ReadingID`
- `MachineCode`
- `ProductionLine`
- `ReadingTime`
- `AllReadingCount`

## Skills practiced

- `COUNT(*) OVER()` across the complete result set
- A window with no partition and no calculation order

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
