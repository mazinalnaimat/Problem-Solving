# Challenge 3: Compare team and team-priority ticket checksums

## Required result

- Calculate one ticket-ID checksum for each team.
- Calculate another checksum for each team-and-priority combination.
- Keep every ticket row.
- Sort by `TeamName`, `Priority`, and `TicketID`.

## Table(s)

- `dbo.SupportTickets`

## Columns to show

- `TicketID`
- `TeamName`
- `Priority`
- `TeamTicketChecksum`
- `TeamPriorityTicketChecksum`

## Skills practiced

- Multiple checksum windows in one query
- Comparing broad and narrow partitions

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
