# Challenge 1: Global checksum of all machine-reading IDs

## Required result

- Keep every machine-reading row.
- Calculate one checksum from all `ReadingID` values returned by the query.
- Do not use `PARTITION BY`.
- Sort by `ReadingTime` and `ReadingID`.

## Table(s)

- `dbo.MachineReadings`

## Columns to show

- `ReadingID`
- `MachineCode`
- `ReadingTime`
- `AllReadingIDChecksum`

## Skills practiced

- `CHECKSUM_AGG(...) OVER()` across the complete result
- A checksum window with no partition

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
