# Challenge 2: LAST_VALUE challenge 2: last delivery delay

## Task

Show every row and return the last delivery delay according to the requested ordering.

## Requirements

- Use `LAST_VALUE`.
- Partition by `DriverName`.
- Use `ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING`.

## Tables

- `dbo.DeliveryTrips`

## Setup

Run these files first:

1. `00_Database_Setup/01_AllInOne_Create_Database.sql`
2. `00_Database_Setup/03_Extended_Challenge_Data.sql`

## Try first

Write your query in `MySol.sql` before opening `Solution.sql`.
