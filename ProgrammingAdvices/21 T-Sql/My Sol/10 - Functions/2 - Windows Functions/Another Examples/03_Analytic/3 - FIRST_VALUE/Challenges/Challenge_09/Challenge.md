# Challenge 9: FIRST_VALUE challenge 9: first highest machine output in each line

## Task

Show every row and return the first highest machine output in each line according to the requested ordering.

## Requirements

- Use `FIRST_VALUE`.
- Partition by `ProductionLine`.
- Use `ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING`.

## Tables

- `dbo.MachineReadings`

## Setup

Run these files first:

1. `00_Database_Setup/01_AllInOne_Create_Database.sql`
2. `00_Database_Setup/03_Extended_Challenge_Data.sql`

## Try first

Write your query in `MySol.sql` before opening `Solution.sql`.
