# Challenge 7: MAX challenge 7: website traffic by site and channel

## Required result

Return `TrafficID`, `SiteName`, `Channel`, `VisitDate`, `Revenue`, and `ChannelMaximumRevenue` from `dbo.WebsiteTraffic`, with `ChannelMaximumRevenue` showing the highest value of `Revenue` for rows that have the same `SiteName` and `Channel`.
Sort the final result by `SiteName` and `Channel` in ascending order.

## Table(s)

- `dbo.WebsiteTraffic`

## Columns to show

- `TrafficID`
- `SiteName`
- `Channel`
- `VisitDate`
- `Revenue`
- `ChannelMaximumRevenue`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySol.sql` before checking `Solution.sql`.
