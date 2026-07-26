# Challenge 2: Reading-ID checksum per production line

## Required result

- Keep every detail row.
- Restart the checksum for each production line.
- Sort by `ProductionLine` and `ReadingID`.

## Table(s)

- `dbo.MachineReadings`

## Columns to show

- `ReadingID`
- `MachineCode`
- `ProductionLine`
- `LineReadingIDChecksum`

## Skills practiced

- Partitioned `CHECKSUM_AGG`
- Checksum per business group

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
