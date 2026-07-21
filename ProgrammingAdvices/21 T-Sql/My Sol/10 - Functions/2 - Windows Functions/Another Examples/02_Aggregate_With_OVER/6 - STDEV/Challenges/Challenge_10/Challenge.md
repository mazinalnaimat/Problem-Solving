# Challenge 10: Compare full-line and running sample deviation of output

## Required result

- Calculate the full-group sample standard deviation with regular `GROUP BY` aggregation.
- Also calculate a running sample standard deviation beside each detail row with `OVER()`.
- Join the grouped result back to the detail rows.
- Ignore rows where `OutputUnits` is `NULL`.

## Table(s)

- `dbo.MachineReadings`

## Columns to show

- `ReadingID`
- `ProductionLine`
- `ReadingTime`
- `OutputUnits`
- `ReverseRunningAmountSampleDeviation`

## Skills practiced

- Comparing grouped aggregation with analytic aggregation
- Joining group-level statistics back to detail rows

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
