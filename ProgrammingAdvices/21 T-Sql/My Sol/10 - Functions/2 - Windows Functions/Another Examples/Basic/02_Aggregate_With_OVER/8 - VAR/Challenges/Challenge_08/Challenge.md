# Challenge 8: Utility rows whose squared deviation exceeds running sample variance

## Required result

- Calculate the running average and running sample variance for each BuildingName-and-MeterType group.
- Return only rows whose squared difference from the running average is greater than the running sample variance.
- Filter the window results in an outer query.
- Ignore rows where `Consumption` is `NULL`.

## Table(s)

- `dbo.UtilityReadings`

## Columns to show

- `UtilityReadingID`
- `BuildingName`
- `MeterType`
- `ReadingDate`
- `Consumption`
- `RunningAverageConsumption`
- `RunningConsumptionSampleVariance`

## Skills practiced

- Filtering calculated window statistics
- Squared-deviation comparison for variance

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
