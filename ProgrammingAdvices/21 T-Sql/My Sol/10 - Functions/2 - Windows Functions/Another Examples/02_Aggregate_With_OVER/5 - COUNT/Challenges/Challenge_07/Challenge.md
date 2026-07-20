# Challenge 7: Compare site traffic count with site-channel traffic count

## Required result

- Show one count for the whole site and another for the site-and-channel combination.
- Keep all traffic detail rows.
- Sort by `SiteName`, `Channel`, `VisitDate`, and `TrafficID`.

## Table(s)

- `dbo.WebsiteTraffic`

## Columns to show

- `TrafficID`
- `SiteName`
- `Channel`
- `VisitDate`
- `SiteRowCount`
- `SiteChannelRowCount`

## Skills practiced

- Different partition definitions in the same query
- Comparing broad and narrow windows

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
