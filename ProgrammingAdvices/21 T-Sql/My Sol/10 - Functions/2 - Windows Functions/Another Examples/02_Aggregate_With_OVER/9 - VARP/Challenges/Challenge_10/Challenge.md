# Challenge 10: Compare full-team and running population variance of points

## Required result

- Calculate the full-group population variance with regular `GROUP BY` aggregation.
- Also calculate a running population variance beside each detail row with `OVER()`.
- Join the grouped result back to the detail rows.
- Ignore rows where `Points` is `NULL`.

## Table(s)

- `dbo.RaceResults`

## Columns to show

- `ResultID`
- `TeamName`
- `RaceDate`
- `Points`
- `ReverseRunningSeatPopulationVariance`

## Skills practiced

- Comparing grouped aggregation with analytic aggregation
- Joining group-level statistics back to detail rows

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
