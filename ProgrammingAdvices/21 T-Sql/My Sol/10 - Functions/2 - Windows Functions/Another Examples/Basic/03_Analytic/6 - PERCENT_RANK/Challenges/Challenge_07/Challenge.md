# Challenge 7: PERCENT_RANK challenge 7: sessions inside each site and channel

## Task

Calculate the relative rank from 0 to 1 of sessions inside each site and channel while keeping every detail row.

## Requirements

- Use `PERCENT_RANK()`.
- Partition by `SiteName, Channel`.
- Order by `Sessions`.

## Tables

- `dbo.WebsiteTraffic`

## Setup

Run these files first:

1. `00_Database_Setup/01_AllInOne_Create_Database.sql`
2. `00_Database_Setup/03_Extended_Challenge_Data.sql`

## Try first

Write your query in `MySol.sql` before opening `Solution.sql`.
