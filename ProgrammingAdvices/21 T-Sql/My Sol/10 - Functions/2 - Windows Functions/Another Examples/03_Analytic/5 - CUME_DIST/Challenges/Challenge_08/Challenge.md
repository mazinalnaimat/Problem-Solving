# Challenge 8: CUME_DIST challenge 8: consumption inside each building and meter

## Task

Calculate the cumulative distribution of consumption inside each building and meter while keeping every detail row.

## Requirements

- Use `CUME_DIST()`.
- Partition by `BuildingName, MeterType`.
- Order by `Consumption`.

## Tables

- `dbo.UtilityReadings`

## Setup

Run these files first:

1. `00_Database_Setup/01_AllInOne_Create_Database.sql`
2. `00_Database_Setup/03_Extended_Challenge_Data.sql`

## Try first

Write your query in `MySol.sql` before opening `Solution.sql`.
