# Challenge 6: Open-ticket summaries with priority labels

## Required result

- Use only tickets where `ClosedAt` is `NULL`.
- Format each ticket as `[Priority] TicketTitle`.
- Order entries by `OpenedAt` and `TicketID`.
- Return one row per team.

## Table(s)

- `dbo.SupportTickets`

## Columns to show

- `TeamName`
- `OpenTicketSummary`

## Skills practiced

- Conditional row filtering
- Concatenating labels and titles

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
