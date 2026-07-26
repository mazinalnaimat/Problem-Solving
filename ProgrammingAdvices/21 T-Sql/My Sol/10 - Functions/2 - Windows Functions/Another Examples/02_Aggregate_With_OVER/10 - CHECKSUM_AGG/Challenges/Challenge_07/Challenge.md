# Challenge 7: Compare site and site-channel traffic checksums

## Required result

- Calculate a checksum for all traffic IDs belonging to the same site.
- Calculate another checksum for IDs belonging to the same site-and-channel combination.
- Keep every traffic row.
- Sort by `SiteName`, `Channel`, `VisitDate`, and `TrafficID`.

## Table(s)

- `dbo.WebsiteTraffic`

## Columns to show

- `TrafficID`
- `SiteName`
- `Channel`
- `SiteTrafficChecksum`
- `SiteChannelTrafficChecksum`

## Skills practiced

- Two `CHECKSUM_AGG` windows
- Comparing checksum scope

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
