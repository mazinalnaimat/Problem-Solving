# Challenge 8: LAST_VALUE challenge 8: last utility cost

## Task

Show every row and return the last utility cost according to the requested ordering.

## Requirements

- Use `LAST_VALUE`.
- Partition by `BuildingName, MeterType`.
- Use `ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING`.

## Tables

- `dbo.UtilityReadings`

## Setup

Run these files first:

1. `00_Database_Setup/01_AllInOne_Create_Database.sql`
2. `00_Database_Setup/03_Extended_Challenge_Data.sql`

## Try first

Write your query in `MySol.sql` before opening `Solution.sql`.
