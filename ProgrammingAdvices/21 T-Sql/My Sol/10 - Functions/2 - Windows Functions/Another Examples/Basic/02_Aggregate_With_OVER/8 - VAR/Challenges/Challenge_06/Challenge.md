# Challenge 6: Compare athlete and team running sample variances of finish time

## Required result

- Calculate one running sample variance for each `AthleteName`.
- Calculate a second running sample variance for each `TeamName`.
- Show both results beside every detail row.
- Ignore rows where `FinishSeconds` is `NULL`.

## Table(s)

- `dbo.RaceResults`

## Columns to show

- `ResultID`
- `AthleteName`
- `TeamName`
- `RaceDate`
- `FinishSeconds`
- `AthleteNameRunningFinishSampleVariance`
- `TeamNameRunningFinishSampleVariance`

## Skills practiced

- Multiple window definitions in one query
- Comparing different statistical scopes

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
