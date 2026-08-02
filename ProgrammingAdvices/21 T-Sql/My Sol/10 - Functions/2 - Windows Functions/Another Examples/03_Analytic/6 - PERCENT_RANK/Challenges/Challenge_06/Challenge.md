# Challenge 6: PERCENT_RANK challenge 6: finish time inside each race event

## Task

Calculate the relative rank from 0 to 1 of finish time inside each race event while keeping every detail row.

## Requirements

- Use `PERCENT_RANK()`.
- Partition by `EventName`.
- Order by `FinishSeconds`.

## Tables

- `dbo.RaceResults`

## Setup

Run these files first:

1. `00_Database_Setup/01_AllInOne_Create_Database.sql`
2. `00_Database_Setup/03_Extended_Challenge_Data.sql`

## Try first

Write your query in `MySol.sql` before opening `Solution.sql`.
