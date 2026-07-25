# Challenge 7: Running average and population variance of conversions

## Required result

- Calculate both the running average and running population variance for each SiteName-and-Channel group.
- Add `DifferenceFromRunningAverage` as the current value minus its running average.
- Use a CTE so the window aliases can be reused.
- Ignore rows where `Conversions` is `NULL`.

## Table(s)

- `dbo.WebsiteTraffic`

## Columns to show

- `TrafficID`
- `SiteName`
- `Channel`
- `VisitDate`
- `Conversions`
- `RunningAverageConversions`
- `RunningConversionPopulationVariance`
- `DifferenceFromRunningAverage`

## Skills practiced

- Combining `AVG()` with `VARP()`
- Using a CTE for calculations based on window aliases

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
