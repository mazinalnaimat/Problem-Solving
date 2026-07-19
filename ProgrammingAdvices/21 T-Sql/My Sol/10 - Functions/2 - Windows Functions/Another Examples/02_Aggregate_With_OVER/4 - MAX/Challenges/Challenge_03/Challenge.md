# Challenge 3: MAX challenge 3: three-row moving support-ticket window

## Required result

Return `TicketID`, `AgentName`, `TeamName`, `OpenedAt`, `ResolutionMinutes`, and `MovingMaximumResolution` from `dbo.SupportTickets`, with `MovingMaximumResolution` showing the highest value of `ResolutionMinutes` for rows that have the same `AgentName`.
Order each calculation group by `OpenedAt` and `TicketID` in ascending order, and calculate `MovingMaximumResolution` from the current row and the two previous rows when they exist.
Sort the final result by `AgentName`, `OpenedAt`, and `TicketID` in ascending order.

## Table(s)

- `dbo.SupportTickets`

## Columns to show

- `TicketID`
- `AgentName`
- `TeamName`
- `OpenedAt`
- `ResolutionMinutes`
- `MovingMaximumResolution`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySol.sql` before checking `Solution.sql`.
