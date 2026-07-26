# Challenge 9: Group and global utility-reading checksums together

## Required result

- Calculate one checksum for each building-and-meter combination.
- Calculate a second checksum across all utility-reading IDs.
- Keep every detail row.
- Sort by `BuildingName`, `MeterType`, `ReadingDate`, and `UtilityReadingID`.

## Table(s)

- `dbo.UtilityReadings`

## Columns to show

- `UtilityReadingID`
- `BuildingName`
- `MeterType`
- `MeterReadingChecksum`
- `AllUtilityReadingChecksum`

## Skills practiced

- Partitioned and unpartitioned windows together
- Local versus global checksum

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
