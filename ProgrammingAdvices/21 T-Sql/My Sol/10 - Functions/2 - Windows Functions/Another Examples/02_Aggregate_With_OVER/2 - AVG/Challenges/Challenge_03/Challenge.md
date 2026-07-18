# Challenge 3: AVG challenge 3: three-row moving support-ticket window

## Required result

Return `TicketID`, `AgentName`, `TeamName`, `OpenedAt`, `ResolutionMinutes`, and `MovingAverageResolution` from `dbo.SupportTickets`, with `MovingAverageResolution` showing the average of `ResolutionMinutes` for rows that have the same `AgentName`.
Order each calculation group by `OpenedAt` and `TicketID` in ascending order, and calculate `MovingAverageResolution` from the current row and the two previous rows when they exist.
Sort the final result by `AgentName`, `OpenedAt`, and `TicketID` in ascending order.

## Table(s)

- `dbo.SupportTickets`

## Columns to show

- `TicketID`
- `AgentName`
- `TeamName`
- `OpenedAt`
- `ResolutionMinutes`
- `MovingAverageResolution`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySol.sql` before checking `Solution.sql`.
