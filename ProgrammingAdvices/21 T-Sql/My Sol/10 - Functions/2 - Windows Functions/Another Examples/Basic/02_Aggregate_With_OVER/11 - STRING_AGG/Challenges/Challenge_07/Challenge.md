# Challenge 7: Website channel summaries with total rows and channel list

## Required result

- Return one row per site.
- List each channel once and alphabetically.
- Also return the number of distinct channels for the site.
- Use a CTE to remove repeated site-channel pairs.

## Table(s)

- `dbo.WebsiteTraffic`

## Columns to show

- `SiteName`
- `DistinctChannelCount`
- `Channels`

## Skills practiced

- Combining `COUNT` and `STRING_AGG`
- Aggregating a deduplicated CTE

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
