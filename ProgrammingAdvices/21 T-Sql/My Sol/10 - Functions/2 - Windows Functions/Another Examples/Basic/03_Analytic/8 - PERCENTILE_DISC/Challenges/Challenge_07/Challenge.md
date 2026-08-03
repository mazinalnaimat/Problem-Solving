# Challenge 7: PERCENTILE_DISC challenge 7: median website sessions

## Task

Show each detail row and calculate the median website sessions for its partition.

## Requirements

- Use `PERCENTILE_DISC(0.50)`.
- Order the percentile by `Sessions`.
- Partition by `SiteName, Channel`.

## Tables

- `dbo.WebsiteTraffic`

## Setup

Run these files first:

1. `00_Database_Setup/01_AllInOne_Create_Database.sql`
2. `00_Database_Setup/03_Extended_Challenge_Data.sql`

## Try first

Write your query in `MySol.sql` before opening `Solution.sql`.
