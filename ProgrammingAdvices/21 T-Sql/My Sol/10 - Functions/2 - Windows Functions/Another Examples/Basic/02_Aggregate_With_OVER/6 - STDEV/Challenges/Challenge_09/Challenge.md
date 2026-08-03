# Challenge 9: Sample deviation of daily average defects by production line

## Required result

- First group the source rows by ProductionLine and calendar date.
- Calculate `DailyAverageDefectCount` for each grouped day.
- Then calculate a running sample standard deviation of those daily averages.
- Return one row per grouped day, not one row per source record.

## Table(s)

- `dbo.MachineReadings`

## Columns to show

- `ProductionLine`
- `ReadingDate`
- `DailyAverageDefectCount`
- `RunningDailyDailyDefectSampleDeviation`

## Skills practiced

- Aggregate first, then apply a window function
- CTE with grouped rows feeding an analytic statistic

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
