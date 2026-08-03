# Challenge 10: Closed-ticket checksums calculated in a CTE

## Required result

- Use a CTE to keep only closed tickets before calculating the checksum.
- Calculate one ticket-ID checksum per team.
- Return only closed-ticket details.
- Sort by `TeamName`, `ClosedAt`, and `TicketID`.

## Table(s)

- `dbo.SupportTickets`

## Columns to show

- `TicketID`
- `TeamName`
- `ClosedAt`
- `ClosedTicketChecksum`

## Skills practiced

- Filtering before a window calculation
- CTE organization with `CHECKSUM_AGG`

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
