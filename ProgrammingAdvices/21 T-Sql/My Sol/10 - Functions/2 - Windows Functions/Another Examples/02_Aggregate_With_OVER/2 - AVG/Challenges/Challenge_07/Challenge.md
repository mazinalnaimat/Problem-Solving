# Challenge 7: AVG challenge 7: website traffic by site and channel

## Required result

Return `TrafficID`, `SiteName`, `Channel`, `VisitDate`, `Conversions`, and `ChannelAverageConversions` from `dbo.WebsiteTraffic`, with `ChannelAverageConversions` showing the average of `Conversions` for rows that have the same `SiteName` and `Channel`.
Sort the final result by `SiteName` and `Channel` in ascending order.

## Table(s)

- `dbo.WebsiteTraffic`

## Columns to show

- `TrafficID`
- `SiteName`
- `Channel`
- `VisitDate`
- `Conversions`
- `ChannelAverageConversions`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySol.sql` before checking `Solution.sql`.
