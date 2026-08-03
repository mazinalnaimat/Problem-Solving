# Challenge 1: Overall running population variance of defect count

## Required result

- Calculate a running population variance across all returned rows without `PARTITION BY`.
- Order the calculation by `ReadingTime` and `ReadingID`.
- Ignore rows where `DefectCount` is `NULL`.
- Sort by `ReadingTime` and `ReadingID`.

## Table(s)

- `dbo.MachineReadings`

## Columns to show

- `ReadingID`
- `ReadingTime`
- `DefectCount`
- `OverallRunningDefectPopulationVariance`

## Skills practiced

- Global ordered `VARP()` window
- An analytic window without `PARTITION BY`

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
