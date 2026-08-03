# Challenge 3: Running sample deviation of resolution time by team

## Required result

- Restart the running sample standard deviation for every unique `TeamName`.
- Order rows by `OpenedAt` and `TicketID` inside each combination.
- Ignore rows where `ResolutionMinutes` is `NULL`.
- Sort by `TeamName`, `OpenedAt`, and `TicketID`.

## Table(s)

- `dbo.SupportTickets`

## Columns to show

- `TicketID`
- `TeamName`
- `ResolutionMinutes`
- `RunningResolutionSampleDeviationByTwoGroups`

## Skills practiced

- Ordered `STDEV()` with a column partition
- Composite grouping inside `OVER()`

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
