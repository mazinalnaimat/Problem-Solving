# Challenge 3: Running population variance of satisfaction by team and priority

## Required result

- Restart the running population variance for every unique combination of `TeamName` and `Priority`.
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
- `RunningSatisfactionPopulationVarianceByTwoGroups`

## Skills practiced

- Ordered `VARP()` with a multi-column partition
- Composite grouping inside `OVER()`

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
