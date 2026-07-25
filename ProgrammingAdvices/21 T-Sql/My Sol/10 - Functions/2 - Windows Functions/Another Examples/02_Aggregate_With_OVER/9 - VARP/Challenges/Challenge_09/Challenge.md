# Challenge 9: Population variance of daily average vibration by production line

## Required result

- First group the source rows by ProductionLine and calendar date.
- Calculate `DailyAverageVibrationMmS` for each grouped day.
- Then calculate a running population variance of those daily averages.
- Return one row per grouped day, not one row per source record.

## Table(s)

- `dbo.MachineReadings`

## Columns to show

- `ProductionLine`
- `ReadingDate`
- `DailyAverageVibrationMmS`
- `RunningDailyDailyVibrationPopulationVariance`

## Skills practiced

- Aggregate first, then apply a window function
- CTE with grouped rows feeding an analytic statistic

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
