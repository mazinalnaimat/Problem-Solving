# Challenge 2: PERCENTILE_DISC challenge 2: 75th percentile delivery delay

## Task

Show each detail row and calculate the 75th percentile delivery delay for its partition.

## Requirements

- Use `PERCENTILE_DISC(0.75)`.
- Order the percentile by `DelayMinutes`.
- Partition by `Depot`.

## Tables

- `dbo.DeliveryTrips`

## Setup

Run these files first:

1. `00_Database_Setup/01_AllInOne_Create_Database.sql`
2. `00_Database_Setup/03_Extended_Challenge_Data.sql`

## Try first

Write your query in `MySol.sql` before opening `Solution.sql`.
