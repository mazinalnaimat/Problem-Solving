# Challenge 8: PERCENTILE_DISC challenge 8: 90th percentile utility consumption

## Task

Show each detail row and calculate the 90th percentile utility consumption for its partition.

## Requirements

- Use `PERCENTILE_DISC(0.90)`.
- Order the percentile by `Consumption`.
- Partition by `BuildingName, MeterType`.

## Tables

- `dbo.UtilityReadings`

## Setup

Run these files first:

1. `00_Database_Setup/01_AllInOne_Create_Database.sql`
2. `00_Database_Setup/03_Extended_Challenge_Data.sql`

## Try first

Write your query in `MySol.sql` before opening `Solution.sql`.
