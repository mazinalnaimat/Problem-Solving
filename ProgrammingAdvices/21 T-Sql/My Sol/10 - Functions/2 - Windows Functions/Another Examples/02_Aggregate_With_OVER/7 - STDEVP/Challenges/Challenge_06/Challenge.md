# Challenge 6: Compare athlete and team running population deviations of points

## Required result

- Calculate one running population standard deviation for each `AthleteName`.
- Calculate a second running population standard deviation for each `TeamName`.
- Show both results beside every detail row.
- Ignore rows where `Points` is `NULL`.

## Table(s)

- `dbo.RaceResults`

## Columns to show

- `ResultID`
- `AthleteName`
- `TeamName`
- `RaceDate`
- `Points`
- `AthleteNameRunningPointPopulationDeviation`
- `TeamNameRunningPointPopulationDeviation`

## Skills practiced

- Multiple window definitions in one query
- Comparing different statistical scopes

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
