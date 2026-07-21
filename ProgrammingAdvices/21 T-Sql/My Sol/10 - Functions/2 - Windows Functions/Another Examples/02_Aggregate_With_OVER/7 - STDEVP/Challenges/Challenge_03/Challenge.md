# Challenge 3: Running population deviation of satisfaction by team and priority

## Required result

- Restart the running population standard deviation for every unique combination of `TeamName` and `Priority`.
- Order rows by `OpenedAt` and `TicketID` inside each combination.
- Ignore rows where `SatisfactionScore` is `NULL`.
- Sort by `TeamName`, `Priority`, `OpenedAt`, and `TicketID`.

## Table(s)

- `dbo.SupportTickets`

## Columns to show

- `TicketID`
- `TeamName`
- `Priority`
- `OpenedAt`
- `SatisfactionScore`
- `RunningSatisfactionPopulationDeviationByTwoGroups`

## Skills practiced

- Ordered `STDEVP()` with a multi-column partition
- Composite grouping inside `OVER()`

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
