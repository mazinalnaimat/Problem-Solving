# Challenge 7: MIN challenge 7: website traffic by site and channel

## Required result

Return `TrafficID`, `SiteName`, `Channel`, `VisitDate`, `Sessions`, and `ChannelMinimumSessions` from `dbo.WebsiteTraffic`, with `ChannelMinimumSessions` showing the lowest value of `Sessions` for rows that have the same `SiteName` and `Channel`.
Sort the final result by `SiteName` and `Channel` in ascending order.

## Table(s)

- `dbo.WebsiteTraffic`

## Columns to show

- **`TrafficID`**
- `SiteName`
- `Channel`
- `VisitDate`
- `Sessions`
- `ChannelMinimumSessions`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySol.sql` before checking `Solution.sql`.
