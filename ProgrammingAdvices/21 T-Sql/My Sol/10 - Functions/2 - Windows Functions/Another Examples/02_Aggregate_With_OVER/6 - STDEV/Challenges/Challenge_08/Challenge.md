# Challenge 8: Utility costs farther than one running sample deviation

## Required result

- Calculate the running average and running sample standard deviation for each BuildingName-and-MeterType group.
- Return only rows whose `Cost` differs from its running average by more than one running sample standard deviation.
- Filter the window results in an outer query.
- Ignore rows where `Cost` is `NULL`.

## Table(s)

- `dbo.UtilityReadings`

## Columns to show

- `UtilityReadingID`
- `BuildingName`
- `MeterType`
- `ReadingDate`
- `Cost`
- `RunningAverageCost`
- `RunningCostSampleDeviation`

## Skills practiced

- Filtering calculated window statistics
- Dynamic outlier-style condition using `ABS`

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
