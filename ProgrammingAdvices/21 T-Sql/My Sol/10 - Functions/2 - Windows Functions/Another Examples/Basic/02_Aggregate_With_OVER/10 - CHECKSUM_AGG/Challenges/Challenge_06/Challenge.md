# Challenge 6: Composite race-result checksum per event

## Required result

- Build each row checksum from athlete, team, and points.
- Aggregate the row checksums for each event.
- Keep every race-result row.
- Sort by `EventName`, `RaceDate`, and `ResultID`.

## Table(s)

- `dbo.RaceResults`

## Columns to show

- `ResultID`
- `EventName`
- `AthleteName`
- `TeamName`
- `Points`
- `EventResultDataChecksum`

## Skills practiced

- Composite row checksums
- Partitioned checksum over descriptive and numeric data

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
