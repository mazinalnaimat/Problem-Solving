# Challenge 10: FIRST_VALUE challenge 10: first best race points in each team

## Task

Show every row and return the first best race points in each team according to the requested ordering.

## Requirements

- Use `FIRST_VALUE`.
- Partition by `TeamName`.
- Use `ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING`.

## Tables

- `dbo.RaceResults`

## Setup

Run these files first:

1. `00_Database_Setup/01_AllInOne_Create_Database.sql`
2. `00_Database_Setup/03_Extended_Challenge_Data.sql`

## Try first

Write your query in `MySol.sql` before opening `Solution.sql`.
