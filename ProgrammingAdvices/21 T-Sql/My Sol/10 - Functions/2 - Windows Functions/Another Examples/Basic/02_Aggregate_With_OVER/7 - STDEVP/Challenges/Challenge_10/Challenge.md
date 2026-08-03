# Challenge 10: Compare full-event and running population deviation of finish time

## Required result

- Calculate the full-group population standard deviation with regular `GROUP BY` aggregation.
- Also calculate a running population standard deviation beside each detail row with `OVER()`.
- Join the grouped result back to the detail rows.
- Ignore rows where `FinishSeconds` is `NULL`.

## Table(s)

- `dbo.RaceResults`

## Columns to show

- `ResultID`
- `EventName`
- `RaceDate`
- `FinishSeconds`
- `ReverseRunningSeatPopulationDeviation`

## Skills practiced

- Comparing grouped aggregation with analytic aggregation
- Joining group-level statistics back to detail rows

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
