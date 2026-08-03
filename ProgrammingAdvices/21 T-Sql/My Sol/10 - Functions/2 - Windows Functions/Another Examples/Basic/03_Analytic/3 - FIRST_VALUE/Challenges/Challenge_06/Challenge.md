# Challenge 6: FIRST_VALUE challenge 6: first race finish time

## Task

Show every row and return the first race finish time according to the requested ordering.

## Requirements

- Use `FIRST_VALUE`.
- Partition by `AthleteName`.
- Use `ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING`.

## Tables

- `dbo.RaceResults`

## Setup

Run these files first:

1. `00_Database_Setup/01_AllInOne_Create_Database.sql`
2. `00_Database_Setup/03_Extended_Challenge_Data.sql`

## Try first

Write your query in `MySol.sql` before opening `Solution.sql`.
