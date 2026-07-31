# Challenge 1: LAST_VALUE challenge 1: last machine temperature

## Task

Show every row and return the last machine temperature according to the requested ordering.

## Requirements

- Use `LAST_VALUE`.
- Partition by `MachineCode`.
- Use `ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING`.

## Tables

- `dbo.MachineReadings`

## Setup

Run these files first:

1. `00_Database_Setup/01_AllInOne_Create_Database.sql`
2. `00_Database_Setup/03_Extended_Challenge_Data.sql`

## Try first

Write your query in `MySol.sql` before opening `Solution.sql`.
