# Challenge 3: Three-ticket moving count of resolved tickets

## Required result

- For each agent, inspect only the current ticket and the two previous tickets.
- Count only rows where `ResolutionMinutes` is not `NULL`.
- Sort by `AgentName`, `OpenedAt`, and `TicketID`.

## Table(s)

- `dbo.SupportTickets`

## Columns to show

- `TicketID`
- `AgentName`
- `TeamName`
- `OpenedAt`
- `ResolutionMinutes`
- `ResolvedInLastThreeTickets`

## Skills practiced

- A fixed-size moving window
- Difference between `COUNT(column)` and `COUNT(*)`

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
