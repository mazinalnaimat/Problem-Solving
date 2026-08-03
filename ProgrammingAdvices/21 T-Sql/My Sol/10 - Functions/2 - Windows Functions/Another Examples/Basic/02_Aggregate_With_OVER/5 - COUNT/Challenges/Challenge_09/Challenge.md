# Challenge 9: Running and remaining utility-reading counts

## Required result

- Restart both calculations for each building-and-meter combination.
- `RunningReadingCount` must count from the first row to the current row.
- `RemainingReadingCount` must count from the current row to the final row.
- Sort by `BuildingName`, `MeterType`, `ReadingDate`, and `UtilityReadingID`.

## Table(s)

- `dbo.UtilityReadings`

## Columns to show

- `UtilityReadingID`
- `BuildingName`
- `MeterType`
- `ReadingDate`
- `RunningReadingCount`
- `RemainingReadingCount`

## Skills practiced

- Two opposite window frames
- Running versus remaining calculations

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
