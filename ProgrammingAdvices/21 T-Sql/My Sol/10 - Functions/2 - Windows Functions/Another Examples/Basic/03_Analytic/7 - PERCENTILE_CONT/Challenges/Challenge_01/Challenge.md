# Challenge 1: PERCENTILE_CONT challenge 1: median machine temperature

## Task

Show each detail row and calculate the median machine temperature for its partition.

## Requirements

- Use `PERCENTILE_CONT(0.50)`.
- Order the percentile by `TemperatureC`.
- Partition by `MachineCode`.

## Tables

- `dbo.MachineReadings`

## Setup

Run these files first:

1. `00_Database_Setup/01_AllInOne_Create_Database.sql`
2. `00_Database_Setup/03_Extended_Challenge_Data.sql`

## Try first

Write your query in `MySol.sql` before opening `Solution.sql`.
