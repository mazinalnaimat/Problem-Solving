# Challenge 6: Compare athlete and event running population variances

## Required result

- Calculate one running population variance for each `AthleteName`.
- Calculate a second running population variance for each `EventName`.
- Show both results beside every detail row.
- Ignore rows where `FinishSeconds` is `NULL`.

## Table(s)

- `dbo.RaceResults`

## Columns to show

- `ResultID`
- `AthleteName`
- `EventName`
- `RaceDate`
- `FinishSeconds`
- `AthleteNameRunningFinishPopulationVariance`
- `EventNameRunningFinishPopulationVariance`

## Skills practiced

- Multiple window definitions in one query
- Comparing different statistical scopes

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
