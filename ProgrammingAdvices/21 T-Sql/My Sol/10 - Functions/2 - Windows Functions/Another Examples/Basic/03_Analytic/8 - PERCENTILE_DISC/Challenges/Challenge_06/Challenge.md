# Challenge 6: PERCENTILE_DISC challenge 6: 25th percentile race finish time

## Task

Show each detail row and calculate the 25th percentile race finish time for its partition.

## Requirements

- Use `PERCENTILE_DISC(0.25)`.
- Order the percentile by `FinishSeconds`.
- Partition by `EventName`.

## Tables

- `dbo.RaceResults`

## Setup

Run these files first:

1. `00_Database_Setup/01_AllInOne_Create_Database.sql`
2. `00_Database_Setup/03_Extended_Challenge_Data.sql`

## Try first

Write your query in `MySol.sql` before opening `Solution.sql`.
